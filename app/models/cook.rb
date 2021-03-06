class Cook < ApplicationRecord
  belongs_to :user
  attachment :image
  
  with_options presence: true do
    validates :title
    validates :main
    validates :body
    validates :image
  end
end
