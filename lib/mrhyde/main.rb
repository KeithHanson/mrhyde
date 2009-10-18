require 'ruby-debug'

class Main
  helpers do
    def authenticated?
      !session[:user].nil?
    end
  end
  
  get '/regenerate_blog' do
    debugger
    jekyll_options = Jekyll.configuration({})
    site = Jekyll::Site.new(jekyll_options)
    "HI!"
  end
  
  get '/login' do
    haml :login
  end
  
  post '/rpx_token_url' do
    @user = Main.rpx.auth_info(params['token'])
    #... setup session user
  end
  
  post '/comment/:post_slug' do |post_slug|
    redirect "/login" unless authenticated?
    #... create new post, regenerate site
  end
  
end