class Resource < ActiveRecord::Base
  belongs_to :classification
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true

  enum tag: { essence: 0 }
end
