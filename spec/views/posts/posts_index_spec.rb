require 'rails_helper'

RSpec.describe 'posts/index', type: :feature do
  before(:each) do
    @user = [
      User.create(
        name: 'Tom',
        photo: 'https://picsum.photos/300/200',
        bio: 'Software Engineer Ethiopia',
        posts_counter: 2
      )
    ]

    @first_user = User.first

    @first_post = Post.create(
      author: @first_user,
      title: 'Hello',
      text: 'This is my first post from Tom',
      comments_counter: 1,
      likes_counter: 1
    )
    @second_post = Post.create(
      author: @first_user,
      title: 'How are you?',
      text: 'This is my second post from Tom',
      comments_counter: 0,
      likes_counter: 1
    )
    @first_comment = Comment.create(post: @first_post, author: @first_user, text: 'First comment for Tom')
    @second_comment = Comment.create(post: @second_post, author: @first_user, text: 'Second comment for Tom')
    @first_like = Like.create(post: @first_post, author: @first_user)
    @second_like = Like.create(post: @second_post, author: @first_user)

    visit user_posts_path(@first_user)
  end

  it 'shows the author image' do
    expect(page).to have_css('img')
  end

  it 'shows the author name' do
    expect(page).to have_content(@first_user.name)
  end

  it 'shows the number of posts by the author' do
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end

  it 'shows the post title' do
    expect(page).to have_content(@first_post.title)
  end

  it 'shows the post text/body' do
    expect(page).to have_content(@first_post.text)
  end

  it 'shows the first comments on the post' do
    expect(page).to have_content(@first_comment.text)
  end

  it 'shows the number of comments on the post' do
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end

  it 'shows the number of likes on the post' do
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  it 'show section for pagination if there are more posts than fit on the view' do
    expect(page).to have_css('div.pagination')
  end

  it "when click on a post, it redirects to the post's show page" do
    visit user_posts_path(@first_user)
    click_link @first_post.title
    expect(current_path).to match(user_posts_path(@first_user.id))
  end
end
