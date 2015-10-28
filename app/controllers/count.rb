get '/' do
	@urls = Url.all
	erb :'static/index'
end