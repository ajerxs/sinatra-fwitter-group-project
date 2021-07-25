class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    name = self.username
    @slug = name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect do |name|
      name.slug == slug
    end
  end
end
