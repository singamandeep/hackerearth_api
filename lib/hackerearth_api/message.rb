module Message
	def self.client_secret_nil
		"client_secret is needed. If you do not have a valid client_secret, 
		please register your client at 'https://www.hackerearth.com/api/register'"
	end

	def self.source_nil
		"source code is a required parameter"
	end

	def self.lang_nil
		"lang is a required parameter"
	end

	def self.language_not_supported
		"lang is either invalid or not supported"
	end

	def self.invalid_argument_length(req, passed)
		"wrong number of arguments passed, required #{req}, passed #{passed}"
	end
end