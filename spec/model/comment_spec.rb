require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John', photo: 'https://www.google.com', bio: 'I am a teacher', posts_counter: 3) }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post from Tom') }
  subject do
    Comment.new(
      author: user,
      text: 'Hello',
      post: post # Assign the associated post to the comment
    )
  end

  before { subject.save }

  it 'updates post comments_counter' do
    expect(subject.post.comments_counter).to eq(1)
  end
end
