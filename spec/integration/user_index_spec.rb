require 'rails_helper'

RSpec.describe 'User Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Olivier',
      photo: 'https://user-images.githubusercontent.com/108806646/216281530-fa5c3020-197a-498e-9024-339268ba1959.jpg',
      bio: 'Teacher',
      posts_counter: 6
    )
    @lilly = User.create(
      name: 'Lilly',
      photo: 'https://user-images.githubusercontent.com/108806646/216282490-b94319ec-e115-471d-a453-6458f22e6a1a.jpg',
      bio: 'Teacher from Poland.',
      posts_counter: 2
    )
    visit root_path
  end

  it 'shows username of users' do
    expect(page).to have_content(@tom.name)
    expect(page).to have_content(@lilly.name)
  end

  it 'shows the photo of each user' do
    assert page.has_xpath?("//img[@src = 'https://user-images.githubusercontent.com/108806646/216281530-fa5c3020-197a-498e-9024-339268ba1959.jpg'
     and @alt='user photo']")
    assert page.has_xpath?("//img[@src = 'https://user-images.githubusercontent.com/108806646/216282490-b94319ec-e115-471d-a453-6458f22e6a1a.jpg'
     and @alt = 'user photo']")
  end

  it 'shows the users posts' do
    expect(page).to have_content('Number of posts: 6')
  end

  it 'redirects to users show page' do
    click_on 'Olivier'
    expect(page).to have_current_path user_path(@tom)
    expect(page).to have_content('Teacher')
  end
end
