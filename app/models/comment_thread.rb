class CommentThread < ActiveRecord::Base

  validates :title, :presence => true
  validates :user_id, :presence => true, :numericality => true
  validates :body, :presence => true

  has_many :comments, :order => 'created_at'
  belongs_to :user

end
