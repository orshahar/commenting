class AddBodyToCommentThreads < ActiveRecord::Migration
  def self.up
    add_column :comment_threads, :body, :text
  end

  def self.down
    remove_column :comment_threads, :body
  end
end
