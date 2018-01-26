require "httparty"

module Response

	def self.compile(params)
		compile_endpoint = "https://api.hackerearth.com/v3/code/compile/"
		api_response = HTTParty.post(compile_endpoint, body: params)
		parsed(api_response)
	end

	def self.run(params)
		run_endpoint = "https://api.hackerearth.com/v3/code/run/"
		api_response = HTTParty.post(run_endpoint, body: params)
		parsed(api_response)
	end

private 
	
	def self.parsed(api_response)
		response = api_response.parsed_response
		response["status"] = api_response.code
		return response
	end
end

=begin
HTTParty.post("https://api.hackerearth.com/v3/code/compile/", body: { :client_secret=> "3905bf1332df91f3d9fc3b505dc18701ddae39a1", :source=> "puts('Hello World')", :lang=> "RUBY"})	
=end