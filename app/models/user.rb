#require_relative "../uploaders/avatar_uploader"

class User < ActiveRecord::Base

  #mount_uploader :avatar, AvatarUploader

  attr_accessible :email, :name, :password, :password_confirmation#, :avatar
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, :presence => true, :length => {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :articles, :order => "created_at desc"

  def latest_one_article
    articles.first
  end

  # 加一篇日记
  def new_article
    self.update_attribute :article_count, self.article_count + 1
  end

  # 减一篇日记
  def delete_article
    self.update_attribute :article_count, self.article_count - 1
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  alias_method :latest, :latest_one_article
end
