class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  field :username, type:String
  field :password_digest, type:String
  field :auth_token
  field :auth_expiry_time

  validates :username, :password_digest, :presence => true

  def generate_auth_token
    self.auth_token = SecureRandom.base64(8)
    self.auth_expiry_time = Time.now()+1.day
    self.save
  end

end