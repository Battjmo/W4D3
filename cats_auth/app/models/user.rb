class User < ApplicationRecord
  validates :user_name, :password_digest, presence: true, uniqueness: true 
  
  after_initialize do :reset_session_token!
  end 
  
  has_many :cats,
    foreign_key: :user_id,
    class_name: :Cat
  
  def reset_session_token!
    self.session_token = SecureRandom.base64
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(user_name, password)
    return User.find_by(user_name) if is_password(password)
    nil
  end
end 