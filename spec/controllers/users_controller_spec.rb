require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'user index action' do
    before :each do
      get users_path
    end

    # Check if response status is correct.
    it 'should check if status was correct' do
      expect(response).to have_http_status(200)
    end

    # Check if a correct template is rendered.
    it 'should check if correct index template is rendered' do
      expect(response).to render_template(:index)
    end

    # Check if the response body includes correct placeholder text.
    it 'should check if response body includes correct placeholder text' do
      expect(response.body).to include('Number of posts:')
    end
  end

  context 'user show action' do
    before :each do
      @user = User.create(name: 'Tom', photo: 'https://user-images.githubusercontent.com/108806646/216281530-fa5c3020-197a-498e-9024-339268ba1959.jpg', bio: 'Teacher from Mexico.', posts_counter: 1)
      get user_path(@user.id)
    end

    # Check if response status is correct.
    it 'should check if status was correct' do
      expect(response).to have_http_status(200)
    end

    # Check if a correct template is rendered.
    it 'should check if correct index template is rendered' do
      expect(response).to render_template(:show)
    end

    # Check if the response body includes correct placeholder text.
    it 'should check if response body includes correct placeholder text' do
      expect(response.body).to include('Bio')
    end
  end
end
