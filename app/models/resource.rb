class Resource < ActiveRecord::Base
  belongs_to :classification
  belongs_to :user
  has_many :comments
end
