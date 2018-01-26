require_relative "validation"

class CompileParameters

	def self.get_params(params)

		filtered_params = {}

		# Required parameters
		unless params.key?(:source)
			raise(ExceptionHandler::InvalidParameterException, Message.source_nil)
		end
		filtered_params[:source] = params[:source]
		
		unless params.key?(:lang)
			raise(ExceptionHandler::InvalidParameterException, Message.lang_nil)
		end
		unless Validation.on_language(params[:lang])
			raise(ExceptionHandler::InvalidParameterException, Message.language_not_supported)
		end
		filtered_params[:lang] = params[:lang]
	
		# Optional Parameters
		if params.key?(:async)
			filtered_params[:async] = params[:async]
		end

		if params.key?(:id)
			filtered_params[:id] = params[:id]
		end
		
		if params.key?(:callback)
			filtered_params[:callback] = params[:callback]
		end

		return filtered_params
	end

end