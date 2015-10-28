require 'byebug'

get '/' do
	@urls = Url.all.order(click_count: :desc)
	# byebug
	@url = Url.last
  erb :"static/index"
end

# get '/help' do
# 	erb :'static/help'
# end	
