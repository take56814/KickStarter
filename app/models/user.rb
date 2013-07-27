class User
  include Mongoid::Document
  field :name
  field :nickname
  field :image_url
  field :lang
  field :provider
  field :provider_id

  def self.save_by_twitter_auth!(auth)
    user = self.new
    user.name = auth.info.name
    user.nickname = auth.info.nickname
    user.image_url = auth.info.image
    user.lang = auth.extra.raw_info.lang
    user.provider = auth.provider
    user.provider_id = auth.uid
    
    user.save!
    return user
  end
  
end
