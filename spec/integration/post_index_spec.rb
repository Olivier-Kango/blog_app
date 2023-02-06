require 'rails_helper'

RSpec.describe 'Post Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Tom',
      photo: 'https://user-images.githubusercontent.com/108806646/216281530-fa5c3020-197a-498e-9024-339268ba1959.jpg',
      bio: 'Teacher from Mexico.',
      posts_counter: 5
    )
    @post = Post.create(
      title: 'Bonjour',
      text: 'Comment allez vous?',
      comments_counter: 1,
      likes_counter: 3,
      author_id: @tom.id
    )

    Comment.create(
      post: @post,
      author: @tom,
      text: 'I really like Boostrap',
      post_id: @post.id,
      author_id: @tom.id
    )

    visit user_posts_path(@tom.id)
  end

  it 'shows the profile picture of the user' do
    assert page.has_xpath?("//img[@src = 'https://user-images.githubusercontent.com/108806646/216281530-fa5c3020-197a-498e-9024-339268ba1959.jpg'
    and @alt='user photo']")
  end

  it 'shows the username of user' do
    expect(page).to have_content(@tom.name)
  end

  it 'shows number of posts of user' do
    expect(page).to have_content('Number of posts: 6')
  end

  it 'shows the title of a post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows the body of a post' do
    expect(page).to have_content('Comment allez vous?')
  end

  it 'shows first comments on a post' do
    expect(page).to have_content('I really like Boostrap')
  end

  it 'shows number of comments for a post' do
    expect(page).to have_content('Comments: 2')
  end

  it 'shows number of likes for a post' do
    expect(page).to have_content('Likes: 3')
  end

  it 'shows section for pagination' do
    expect(page).to have_content('Add new Post')
  end

  it 'redirects to posts show page' do
    click_on 'Bonjour'
    expect(page).to have_current_path user_post_path(@tom.id, @post.id)
  end
end
