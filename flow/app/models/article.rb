class Article < ActiveRecord::Base
  has_many :comments

  validates :body, length: { maximum: 600}

end
