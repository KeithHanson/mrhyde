module MrHyde
  class User < Ohm::Model
    attribute :display_name
    attribute :picture
  end
  
  class Comment < Ohm::Model
    attribute :user_id
    attribute :post_slug
    attribute :comment
    
    index :post_slug
  end
end

module Jekyll
  class Post
    attr_accessor :comments
    
    def get_comments
      MrHyde::Comment.find(:post_slug, self.slug).all
    end
    
    alias :old_initialize :initialize
    
    def initialize(site, source, dir, name)
      old_initialize(site, source, dir, name)
      self.comments = get_comments
    end
    
    alias :old_to_liquid :to_liquid
    
    def to_liquid
      {
        "comments" => self.comments,
        "comment_post_url" => "/comment/#{self.slug}",
        "comment_login_url" => "/comment/login",
        "ajax_logged_in_check_url" => "/comment/is_logged_in.json"
      }.deep_merge(self.old_to_liquid)
    end
  end
end