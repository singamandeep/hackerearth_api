require_relative "hackerearth_api/version"
require_relative "hackerearth_api/client"
require_relative "hackerearth_api/exception_handler"
require_relative "hackerearth_api/message"
require_relative "hackerearth_api/validation"

module HackerearthApi

	def self.new(*args)
  		if args.length > 1
  			raise(ExceptionHandler::InvalidParameterException, Message.invalid_argument_length(1, args.length))
  		end
  		Client.new(args[0])
  	end

  	def self.languages
  		return Validation.supported_languages
  	end

end
