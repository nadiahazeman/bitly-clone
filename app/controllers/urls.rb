require_relative '../models/url.rb'


post '/urls' do
	@url = Url.new(long_url: params[:long_url])
		if @url.save
			#redirect "/urls/#{@url.id}"
			@urls = Url.all 
			# return @url.to_json #just a hash to transport data from web to backend
		else
		@urls = Url.all
		@failed = true
	end
		erb :"static/index" #embedded ruby
end	

get '/urls' do
	redirect '/'
end

# get '/all-links' do
# 	@links = Url.pluck(:id, :short_url, :long_url)
# 	@links.to_json
#end

get 'urls/:id' do
	@url = Url.find_by(id: params[:id])
	erb :'static/index'
end	

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	redirect "#{url.long_url}"
end			





#Controller takes in URL from user input and models it for end display

#get :  Requests data from a specified resource
#post:  Submits data to be processed to a specified resource