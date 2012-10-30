class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true, :length => {maximum: 50}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

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

  alias_method :latest, :latest_one_article
end
