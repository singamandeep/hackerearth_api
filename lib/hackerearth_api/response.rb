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
