RSpec.describe HackerearthApi do
	it "has a version number" do
    	expect(HackerearthApi::VERSION).not_to be nil
  	end

  	subject(:valid_client_object){ HackerearthApi.new("3905bf1332df91f3d9fc3b505dc18701ddae39a1") }

  	describe "when creating a client object" do
		subject(:invalid_object){ HackerearthApi.new("test1", "test2") }
		subject(:invalid_client_object){ HackerearthApi.new(nil) }

		it "passing extra arguments" do
			expect{ invalid_object }.to raise_error(ExceptionHandler::InvalidParameterException, /wrong number of arguments passed/) 
		end

	  	it "passing invalid client_secret" do
	    	expect{ invalid_client_object }.to raise_error(ExceptionHandler::InvalidParameterException, /client_secret is needed/) 
	  	end

	  	it "passing valid client_secret" do
	    	expect(valid_client_object.client_secret_key).to eq "3905bf1332df91f3d9fc3b505dc18701ddae39a1"
	  	end
	end

	describe "when making a compile request" do
		it "passing valid arguments" do
			response = valid_client_object.compile({:source=> "puts('Hello World!')", :lang=> "RUBY"})
			expect(response["status"]).to eq 200
		end

		describe "passing invalid arguments" do
			it "without source" do
				expect{ valid_client_object.compile({:lang=> "RUBY"}) }.to raise_error(ExceptionHandler::InvalidParameterException, /source code is a required parameter/) 
			end

			it "without lang" do
				expect{ valid_client_object.compile({:source=> "puts('Hello World!')"}) }.to raise_error(ExceptionHandler::InvalidParameterException, /lang is a required parameter/) 
			end

			it "with a invalid lang" do
				expect{ valid_client_object.compile({:source=> "puts('Hello World!')", :lang=> "HY"}) }.to raise_error(ExceptionHandler::InvalidParameterException, "lang is either invalid or not supported")
			end
		end
	end

	describe "when making a run request" do
		it "passing valid arguments" do
			response = valid_client_object.run({:source=> "puts('Hello World!')", :lang=> "RUBY", :time_limit=>3})
			expect(response["status"]).to eq 200
		end

		describe "passing invalid arguments" do
			it "with invalid time_limit and memory_limit" do
				response = valid_client_object.run({:source=> "puts('Hello World!')", :lang=> "RUBY", :time_limit=>8, :memory_limit=>300000})
				expect(response["run_status"]["time_limit"]).to eq 5
			end
		end
	end
end
