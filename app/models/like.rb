class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  validates :user_id, uniqueness: { scope: :image_id } #THIS IS SO USERS WONT LIKE AN IMAGE MULTIPLE TIMES
end
