#look up service for dns
require "json"
require "http/client"

class Ipfinder
	def initialize(domain)
		@domain = domain
	end
	def search
		if @domain.includes? "https://www."
			new_url = @domain.sub("https://www.", "")
		elsif @domain.includes? "http://www."
			new_url = @domain.sub("http://www.", "")
		elsif @domain.includes? "http://"
			new_url = @domain.sub("http://", "")
		elsif @domain.includes? "www."
			new_url = @domain.sub("www.", "")
		end
		url = "https://dns-api.org/A/#{new_url}"
		puts url
		response = HTTP::Client.get url
		j = JSON.parse(response.body)
		ip = j[0]["value"]
		return ip
	end
end
