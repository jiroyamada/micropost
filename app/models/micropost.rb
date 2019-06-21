class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  def like(other_micropost)
    unless self == other_micropost
      self.likes.find_or_create_by(like_id: other_micropost.id)
    end
  end
  
  def unlike(other_micropost)
    like = self.likes.find_by(like_id: other_micropost.id)
    like.destroy if like
  end
end
