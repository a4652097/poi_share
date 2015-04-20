class Comment < ActiveRecord::Base
  after_create :add_comment

  belongs_to :user
  belongs_to :resource

  def add_comment
    if self.created_at.present?
      self.resource.update(updated_at: self.created_at)
    end
  end
end
