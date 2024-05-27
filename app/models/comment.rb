class Comment < ApplicationRecord

  with_options presence: true do
    validates :user
    validates :item
    validates :comment
  end

  belongs_to :user
  belongs_to :item
end
