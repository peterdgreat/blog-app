require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Test User', posts_counter: 0)
  before { user.save }
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'posts counter should only be an integer' do
    user.posts_counter = 'test'
    expect(user).to_not be_valid
  end
  it 'posts counter should be greater than or equal to 0' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end
end
