class Resource < ActiveRecord::Base
  belongs_to :classification
  belongs_to :user
end
