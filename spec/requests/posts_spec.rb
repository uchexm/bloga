require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'Tekhlay', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Ethiopia.') }
  let!(:post) { Post.create(author: user, title: 'My First Post', text: 'Lorem ipsum') }

  describe 'GET /posts' do
    before :each do
      get user_posts_path(user_id: user.id)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders template correctly' do
      expect(response).to render_template(:index)
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end

    it 'shows the correct placeholder text' do
      expect(response.body).to include(user.name)
    end
  end

  describe 'GET /posts/:id' do
    before :each do
      get user_posts_path(user.id, post.id)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders template correctly' do
      expect(response).to render_template(:index)
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end

    it 'shows the correct placeholder text' do
      expect(response.body).to include(user.name)
    end
  end
end
