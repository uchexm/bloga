require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(
      title: 'First post',
      text: 'Hello, world!',
      comments_counter: 3,
      likes_counter: 2
    )
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be maximum 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'should return likes_counter' do
    expect(subject.likes_counter).to eq(2)
  end

  it 'should return most recent comments' do
    expect(subject.most_recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
  end

  it 'likes_counter should be an integer' do
    expect(subject.likes_counter).to be_an(Integer)
  end
end
