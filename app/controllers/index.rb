get '/' do
  # let user create new short URL, display a list of shortened URLs
  @urls = Url.all
  erb :index
end

get '/shorten/:short_url' do
  # go to info page about the found or created shorten link
  @url = Url.find_by_short_url(params[:short_url])
  erb :url_info
end

post '/urls' do
  # create a new Url
  @url = Url.find_or_create_by_long_url(long_url: params[:url])
  User.find(session[:user_id]).urls << @url if session[:user_id]
  redirect ("/shorten/#{@url.short_url}")
end

get '/sign_up' do
  erb :_sign_up
end

get '/sign_out' do
  session.clear
  redirect ('/')
end

post '/sign_in' do
  @user = User.authenticate(params[:email], params[:password])
  session[:user_id] = @user.id
  redirect('/')
end

post '/sign_up' do
  @user = User.new(params[:user])
  @user.save!
  redirect('/')
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  @url = Url.find_by_short_url(params[:short_url])
  @url.increment_click_count
  redirect ("#{@url.long_url}")
end