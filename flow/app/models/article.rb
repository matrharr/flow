class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :body, length: { maximum: 600}

end
