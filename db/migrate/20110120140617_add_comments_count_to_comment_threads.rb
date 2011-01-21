class AddCommentsCountToCommentThreads < ActiveRecord::Migration
  def self.up
    add_column :comment_threads, :comments_count, :integer
  end

  def self.down
    remove_column :comment_threads, :comments_count
  end
end
