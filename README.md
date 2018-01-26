# HackerearthApi

A Ruby client for the official [Hackerearth API](https://www.hackerearth.com/docs/wiki/developers/v3/). Supports both the API endpoints. Can be used to compile and run code.

## Installation

Add this line to your application's Gemfile:

```ruby
	gem 'hackerearth_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hackerearth_api

## Usage

### Creating a Instance
To start using gem, you can create a new client instance by passing the client_secret to the constructor as
```ruby
	hacker = HackerearthApi.new("[your-client-secret]")
```

### Setting Parameters
Since, the instance already has the client_secret you only need to pass rest of the parameters to make a request. 'source'(source code) and 'lang'(language) the required parameters for both the calls, not passing them will raise an ```ExceptionHandler::InvalidParameterException``` exception. 

To view the list of languages supported you can do as follows
```ruby
	HackerearthApi.languages
```

'time_limit' and 'memory_limit' should be atmost 5 and 262144 respectively, any values greater than maximum value are set to the maximum value.  

### Making a Request
Now you can further make compile and run calls to the API as follows by passing the parameters mentioned in the API documentation, in the form of a hash.
```ruby
	hacker.compile({:source=>"puts('Hello World!')", :lang=>"RUBY"})

	hacker.run({:source=>"puts('Hello World!')", :lang=>"RUBY"})	
```

### Response from API
The result of both the calls is in the form of a ruby hash. 
It will contain the response same as mentioned in the API documentation, along with another key in hash named "status", which will be the http status of the reponse.

### Editing the Instance
You can view or change the current objects client_secret
```ruby
	# To read
	hacker.client_secret_key  
	
	# To change
	hacker.client_secret= [new-client-secret]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amandeep511997/hackerearth_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
