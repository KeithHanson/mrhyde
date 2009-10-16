class Main
  helpers do
    def authenticated?
      !session[:user].nil?
    end
  end
  
  get '/' do
    haml :index
  end
  
  get '/login' do
    haml :login
  end
  
  post '/rpx_token_url' do
    @user = Main.rpx.auth_info(params['token'])
    #...
  end
  
  get '/:post_slug' do |post_slug|
    
  end
  
  post '/:post_slug/comment' do |post_slug|
    redirect "/login" unless authenticated?
  end
  
end