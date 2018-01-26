class Validation
	
	@@supported_languages = [
		'C', 
		'CPP', 
		'CPP11', 
		'CLOJURE', 
		'CSHARP', 
		'JAVA', 
		'JAVASCRIPT', 
		'HASKELL', 
		'PERL', 
		'PHP', 
		'PYTHON', 
		'RUBY'
	]

	def self.supported_languages
		@@supported_languages
	end

	def self.on_language(lang)
		@@supported_languages.include? lang
	end
end