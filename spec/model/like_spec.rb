require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John', photo: 'https://www.google.com', bio: 'I am a teacher', posts_counter: 3) }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post from Tom') }
  subject do
    Like.new(
      author: user,
      post: post
    )
  end

  before { subject.save }

  it 'should return post' do
    expect(subject.post).to eq(post)
  end

  it 'should return user' do
    expect(subject.author).to eq(user)
  end

  it 'should return post likes_counter' do
    expect(subject.post.likes_counter).to eq(1)
  end
end
