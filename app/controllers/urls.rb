require_relative '../models/url.rb'


post '/urls' do
	@url = Url.new(long_url: params[:long_url])
		if @url.save
			return @url.to_json
		else
		@urls = Url.all
		@failed = true

		erb :"static/index"
		end
end	

get '/urls' do
	redirect '/'
end

get '/all-links' do
	@links = Url.pluck(:id, :short_url, :long_url)
	@links.to_json
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	url.count
	redirect "#{url.long_url}"
end			





#Controller takes in URL from user input and models it for end display

#get :  Requests data from a specified resource
#post:  Submits data to be processed to a specified resource