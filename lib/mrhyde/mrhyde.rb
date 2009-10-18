module MrHyde
  class User < Ohm::Model
    attribute :display_name
    attribute :picture
  end
  
  class Comment < Ohm::Model
    attribute :user_id
    attribute :post_name
    attribute :comment
    
    index :post_name
  end
end

module Jekyll
  class Post
    attr_accessor :comments
    
    def get_comments
      MrHyde::Comment.find(:post_name, self.post_name)
    end
    
    alias :old_initialize :initialize
    
    def initialize(site, source, dir, name)
      old_initialize(site, source, dir, name)
      get_comments
    end
    
    alias :old_to_liquid :to_liquid
    
    def to_liquid
      {"comments" => self.comments}.deep_merge(self.old_to_liquid)
    end
  end
end