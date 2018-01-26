require_relative "validation"
require_relative "compile_parameters"

class RunParameters

	def self.get_params(params)		
		filtered_params = CompileParameters.get_params(params)

		if params.key?(:time_limit) and params[:time_limit] < 6 
			filtered_params[:time_limit] = params[:time_limit]
		else 
			filtered_params[:time_limit] = 5
		end

		if params.key?(:memory_limit) and params[:memory_limit] < 262145 
			filtered_params[:memory_limit] = params[:memory_limit]
		else 
			filtered_params[:memory_limit] = 262144
		end
	
		if params.key?(:input)
			filtered_params[:input] = params[:input]
		end		
		
		return filtered_params
	end

end

