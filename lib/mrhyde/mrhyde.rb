module MrHyde
  class User 
    include Mongoid::Document

    field :identifier
    field :display_name
    field :photo
    
    def self.default_gravitar
      default_image_url = "http://www.gravatar.com/avatar.php?gravatar_id=d41d8cd98f00b204e9800998ecf8427e"
      URI.escape(default_image_url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    end

    def self.gravitar_image(email)
      email = Digest::MD5.hexdigest(email)

      gravatar_base_url = 'http://www.gravatar.com/avatar.php'
      
      gravatar_size = 40
      
      return gravatar_base_url + "?gravatar_id=#{email}&default=#{self.default_gravitar}&size=#{gravatar_size}"
    end
    
    def self.process_rpx(user)
      new_user = self.find(:identifier, user.json["profile"]["identifier"]).all.first || User.new
      
      new_user.identifier = user.json["profile"]["identifier"]
      
      case user.json["profile"]["providerName"].downcase      
        when "facebook"
          new_user.display_name = user.json["profile"]["name"]["formatted"]
          new_user.photo = user.json["profile"]["photo"]
        when "twitter"
          new_user.display_name = user.json["profile"]["displayName"]
          new_user.photo = user.json["profile"]["photo"]
        when "google"
          new_user.display_name = user.json["profile"]["displayName"]
          new_user.photo = self.gravitar_image(user.json["profile"]["email"])
        when "flickr"
          new_user.display_name = user.json["profile"]["name"]["formatted"]
          new_user.photo = self.gravitar_image(user.json["profile"]["email"])
      end
      
      new_user.save
      
      return new_user
    end
  end
  
  class Comment
    include Mongoid::Document
    include Mongoid::Timestamps

    field :post_slug

    field :name
    field :email
    field :commenter_url

    field :comment

    embeds_many :comments
  end
end

module Jekyll
  class Post
    attr_accessor :comments
    
    def get_comments
      MrHyde::Comment.find(:all, :conditions => {:post_slug => self.slug})
    end
    
    alias :old_initialize :initialize
    
    def initialize(site, source, dir, name)
      old_initialize(site, source, dir, name)
      self.comments = get_comments
    end

    alias :old_to_liquid :to_liquid
    
    def to_liquid
      {
        "slug" => self.slug,
        "comments" => self.comments,
        "comment_post_url" => "/comment/#{self.slug}"
      }.deep_merge(self.old_to_liquid)
    end
  end
end
