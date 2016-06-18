class User < ActiveRecord::Base
  has_many :articles
  has_many :comments

  attr_accessor :name, :email

  validates :name, presence:true, length: {maximum: 50}
  validates :email, presence:true, length: {maximum: 255}


end
