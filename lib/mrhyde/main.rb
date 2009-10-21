require 'ruby-debug'

class Main
  helpers do
    def logged_in_user
      @user ||= MrHyde::User[session[:user]]
      unless @user.nil?
        "{name: '#{@user.display_name}', photo: '#{@user.photo}'}"
      else
        "{}"
      end
    end

    def authenticated?
      !session[:user].nil?
    end
    
    def rpx
      @rpx ||= Evri::RPX::Session.new(options.rpx_key)
    end
  end
  
  get '/regenerate_blog' do
    #fix this... need to pull in jekyll options from dir 
    jekyll_options = Jekyll.configuration({})
    site = Jekyll::Site.new(jekyll_options)
    site.process
    #Need error handling here
    "Blog has been regenerated"
  end
  
  post '/rpx_token_url' do
    @user = rpx.auth_info(params['token'])
    new_user = MrHyde::User.process_rpx(@user)
    session[:user] = new_user.id
    redirect options.post_login_redirect 
  end
  
  post '/comment/:post_slug' do |post_slug|
    #This URL must be implemented by the Jekyll site.
    redirect "/login" unless authenticated?
    #... create new post, regenerate site
  end
  
  get '/comment/is_logged_in.json' do
    content_type :json
    "{authenticated: #{authenticated?}, user: #{logged_in_user}}" 
  end
  
end

