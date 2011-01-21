class Comment < ActiveRecord::Base
  validates :body, :presence => true
  validates :comment_thread_id, :presence => true, :numericality => true
  validates :user_id, :presence => true, :numericality => true

  belongs_to :comment_thread, :counter_cache => true
  belongs_to :user
  belongs_to :parent, :class_name => 'Comment', :foreign_key => 'parent_id'
  has_many :replies, :class_name => 'Comment', :foreign_key => 'parent_id'

end
