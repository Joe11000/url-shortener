get '/' do
  # Look in app/views/index.erb
  @url_history = Url.all
  erb :index
end

get '/:short_url' do
  #redirect to appropriate long url
  u = Url.find_by_short_url(params[:short_url])
  u.update(click_counter: u.click_counter + 1)
  puts u.long_url
  redirect to "#{u.long_url}"

end

post '/urls' do
  #create a new Url
  p params
  @url = Url.find_by_long_url(params[:long_url])
  @url = Url.create(long_url: params[:long_url]) unless @url
  p @url
  erb :result
end
