class CreateCommentThreads < ActiveRecord::Migration
  def self.up
    create_table :comment_threads do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comment_threads
  end
end
