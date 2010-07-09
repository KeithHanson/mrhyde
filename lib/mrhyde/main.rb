class Main
  get '/regenerate_blog' do
    #fix this... need to pull in jekyll options from dir 
    jekyll_options = Jekyll.configuration({})
    site = Jekyll::Site.new(jekyll_options)
    site.process
    #Need error handling here
    "Blog has been regenerated!"
  end

  post '/comment/:post_slug' do |post_slug|
    
  end

  post '/comment/:post_slug/:comment_id' do |post_slug|
    
  end


end
