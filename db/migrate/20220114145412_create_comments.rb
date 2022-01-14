class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :PostId
      t.integer :AuthorId
      t.string :Text
      t.date :UpdatedAt
      t.date :CreatedAt

      t.timestamps
    end
  end
end
