require 'rails_helper'

RSpec.describe Like, type: :model do
    user = User.new(name: 'Test User', posts_counter: 0)
    user.save
    post = Post.new(title: 'Test Post', text: 'Test Body', author_id: 1, comments_counter: 0, likes_counter: 0)
    post.save
    like = Like.new(author_id: user.id, post_id: post.id)
    like.save
    it 'is valid with valid attributes' do
        expect(like).to be_valid
    end
it 'is not valid without an author_id' do
    like.author_id = nil
    expect(like).to_not be_valid
end
it 'is not valid without a post_id' do
    like.post_id = nil
    expect(like).to_not be_valid
end
it 'author_id should be an integer' do
    like.author_id = 'test'
    expect(like).to_not be_valid
end
it 'post_id should be an integer' do
    like.post_id = 'test'
    expect(like).to_not be_valid
end
it 'update likes counter ' do
    post = Post.find(post.id)
    expect(post.likes_counter).to eq(1)
end
end