class Article < ActiveRecord::Base
  attr_accessible :content, :title, :date

  validates :title, :presence => true, :length => {:maximum => 200}, :uniqueness => true
  validates :content, :presence => true, :length => {:maximum => 20000}

  belongs_to :user

  scope :all_by_created_time, order("created_at desc")

end
