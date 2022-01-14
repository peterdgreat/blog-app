# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_14_153657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "PostId"
    t.integer "AuthorId"
    t.string "Text"
    t.date "UpdatedAt"
    t.date "CreatedAt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.index ["address"], name: "index_comments_on_address"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "AuthorId"
    t.integer "PostId"
    t.date "CreatedAt"
    t.date "UpdatedAt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.index ["address"], name: "index_likes_on_address"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "AuthorId"
    t.string "Title"
    t.string "Text"
    t.date "CreatedAt"
    t.date "UpdatedAt"
    t.integer "CommentCounter"
    t.integer "LikesCounter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.index ["address"], name: "index_posts_on_address"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "bio"
    t.string "UpdatedAt"
    t.string "CreatedAt"
    t.string "PostsCounter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "comment_id", null: false
    t.bigint "post_id", null: false
    t.bigint "like_id", null: false
    t.index ["comment_id"], name: "index_users_on_comment_id"
    t.index ["like_id"], name: "index_users_on_like_id"
    t.index ["post_id"], name: "index_users_on_post_id"
  end

  add_foreign_key "users", "comments"
  add_foreign_key "users", "likes"
  add_foreign_key "users", "posts"
end
