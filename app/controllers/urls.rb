require_relative '../models/url.rb'

get '/' do 
 @urls = Url.all
 # @count = Url.count
 @all_url = Url.all.order(click_count: :desc).limit(10)

 erb :"static/index"
end

post '/urls' do

    @url = Url.find_by(long_url:params[:long_url])
    if @url
        redirect "/urls/#{@url.id}"
    else
        @url= Url.new(long_url:params[:long_url])
        if @url.save
            redirect "/urls/#{@url.id}"
        else
            @urls = Url.all
            @failed = true
            @all_url = Url.all.order(click_count: :desc).limit(10)
            erb :"static/index"
        end
    end
end


get '/urls/:id' do
 @url = Url.find_by(id: params[:id])
 @all_url = Url.all.order(click_count: :desc).limit(10)  
 erb :"static/index"
end

get '/:short_url' do 
 url = Url.find_by(short_url: params[:short_url])
 url.count
 redirect "#{url.long_url}"
end

