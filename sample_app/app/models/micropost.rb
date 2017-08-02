class Micropost < ApplicationRecord
  belongs_to :user
	default_scope -> { order(created_at: :desc) }
	#mount_uploader :picture, PictureUploader  # tests fail when active, don't know why :/
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
end
