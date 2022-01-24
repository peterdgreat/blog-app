class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :AuthorId
      t.string :Title
      t.string :Text
      t.date :CreatedAt
      t.date :UpdatedAt
      t.integer :CommentCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
