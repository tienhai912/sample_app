class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  attr_reader :remember_token

  has_secure_password

  validates :name, presence: true,
    length: {maximum: Settings.user.name_max_length}
  validates :email, presence: true,
    length: {maximum: Settings.user.email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_nil: true,
    length: {minimum: Settings.user.password_min_length}

  before_save :downcase_email

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember_token= value
    @remember_token = value
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if !remember_digest
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attributes remember_digest: nil
  end

  def current_user? user
    self == user
  end

  private
  def downcase_email
    email.downcase!
  end
end
