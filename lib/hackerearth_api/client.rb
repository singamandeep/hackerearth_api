require_relative 'exception_handler'
require_relative 'message'
require_relative 'compile_parameters'
require_relative 'run_parameters'
require_relative 'response'

class Client
	
	attr_accessor :client_secret_key
	
	def initialize(client_secret_key)
		if client_secret_key == nil
			raise(ExceptionHandler::InvalidParameterException, Message.client_secret_nil)
		end
		@client_secret_key = client_secret_key
	end
	
	# compiles the code of the current object
	# params must be a hash
	def compile(params)
		filtered_parameters = CompileParameters.get_params(params)
		filtered_parameters[:client_secret] = @client_secret_key
		Response.compile(filtered_parameters)	
	end

	# run the code of the current object
	# params must be a hash
	def run(params)
		filtered_parameters = RunParameters.get_params(params)
		filtered_parameters[:client_secret] = @client_secret_key
		Response.run(filtered_parameters)
	end

end