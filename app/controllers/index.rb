get '/' do
  # Look in app/views/index.erb
  @url_history = Url.all
  erb :index
end


get '/urls/:id' do
  # displays specific url entry
  @url = Url.find(params[:id])
  erb :result
end

get '/:short_url' do
  # redirect to appropriate long url
  u = Url.find_by_short_url(params[:short_url])
  u.update(click_counter: u.click_counter + 1)
  puts u.long_url
  redirect to "#{u.long_url}"
end

post '/urls' do
  # create a new Url
  @url = Url.create(long_url: params[:long_url]) unless @url
  if @url.valid?
    redirect to "/urls/#{@url.id}"
  else
    erb :index
  end
end

