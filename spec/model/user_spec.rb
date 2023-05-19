require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John',
      photo: 'https://www.google.com',
      bio: 'I am a teacher',
      posts_counter: 0
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should return posts_counter' do
    subject.posts_counter = 0
    expect(subject.posts_counter).to eq(0)
  end

  it 'should return most recent posts' do
    expect(subject.most_recent_posts).to eq(subject.posts.order(created_at: :desc).limit(3))
  end

  it 'posts_counter should be an integer' do
    expect(subject.posts_counter).to be_an(Integer)
  end
end
