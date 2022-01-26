require 'rails_helper'

RSpec.describe Comment, type: :model do
    user = User.new(name: 'Test User', posts_counter: 0)
    user.save
    post = Post.new(title: 'Test Post', text: 'Test Body', author_id: 1, comments_counter: 0, likes_counter: 0)
    post.save
    comment = Comment.new(author_id: user.id, post_id: post.id, text: 'Test Comment')
    comment.save
    it 'is valid with valid attributes' do
        expect(comment).to be_valid
    end
    it 'is not valid without an author_id' do
        comment.author_id = nil
        expect(comment).to_not be_valid
    end
    it 'is not valid without a post_id' do
        comment.post_id = nil
        expect(comment).to_not be_valid
    end
    it 'is not valid without a text' do
        comment.text = nil
        expect(comment).to_not be_valid
    end
    it 'author_id should be an integer' do
        comment.author_id = 'test'
        expect(comment).to_not be_valid
    end
    it 'post_id should be an integer' do
        comment.post_id = 'test'
        expect(comment).to_not be_valid
    end
    it 'text length must not be greater than 250' do
        comment.text = 'a' * 251
        expect(comment).to_not be_valid
    end
    it 'update comments counter ' do
        post = Post.find(post.id)
        expect(post.comments_counter).to eq(1)
    end
end