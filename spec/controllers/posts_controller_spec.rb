require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'post index action' do
    before :each do
      @user = User.create(name: 'Tom',
                          photo: 'https://user-images.githubusercontent.com/108806646/216281530-fa5c3020-197a-498e-9024-339268ba1959.jpg',
                          bio: 'Teacher from Mexico.',
                          posts_counter: 1)
      get "/users/#{@user.id}/posts"
    end

    it 'should check if status was correct' do
      expect(response).to have_http_status(200)
    end

    it 'should check if correct index template is rendered' do
      expect(response).to render_template(:index)
    end

    it 'should check if response body includes correct placeholder text' do
      expect(response.body).to include('Add new Post')
    end
  end

  describe 'post show action' do
    before :each do
      @user = User.create(
        name: 'Tom',
        photo: 'https://user-images.githubusercontent.com/108806646/216281530-fa5c3020-197a-498e-9024-339268ba1959.jpg',
        bio: 'Teacher from Mexico.',
        posts_counter: 1
      )
      @post = Post.create(
        author: @user,
        title: 'Hello',
        text: 'This is my first post',
        user_id: @user.id,
        author_id: @user.id,
        comments_counter: 0,
        likes_counter: 0
      )
      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'should check if status was correct' do
      expect(response).to have_http_status(200)
    end

    it 'should check if correct index template is rendered' do
      expect(response).to render_template(:show)
    end

    it 'should check if response body includes correct placeholder text' do
      expect(response.body).to include('Comments:')
    end
  end
end
