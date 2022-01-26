require 'rails_helper'

RSpec.describe Post, type: :model do
    post = Post.new(title: 'Test Post', text: 'Test Body', author_id: 1, comments_counter: 0, likes_counter: 0)
    it 'is valid with valid attributes' do
        expect(post).to be_valid
    end
    it 'is not valid without a title' do
        post.title = nil
        expect(post).to_not be_valid
    end
    it 'title length must not be greater than 250' do
        post.title = 'a' * 251
        expect(post).to_not be_valid
    end
    it 'comments counter should only be an integer' do
        post.comments_counter = 'test'
        expect(post).to_not be_valid
    end
    it 'comments counter should be greater than or equal to 0' do
        post.comments_counter = -1
        expect(post).to_not be_valid
    end
    it 'likes counter should only be an integer' do
        post.likes_counter = 'test'
        expect(post).to_not be_valid
    end
    it 'likes counter should be greater than or equal to 0' do
        post.likes_counter = -1
        expect(post).to_not be_valid
    end
    
    
end