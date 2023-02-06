require 'rails_helper'

RSpec.describe 'Post Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Tommy',
      photo: 'https://user-images.githubusercontent.com/108806646/216281530-fa5c3020-197a-498e-9024-339268ba1959.jpg',
      bio: 'Teacher from Mexico.',
      posts_counter: 6
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
    visit user_post_path(@tom.id, @post.id)
  end

  it 'shows the title of a post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows the writer of the post' do
    expect(page).to have_content("by #{@tom.name}")
  end

  it 'shows the number of comments for the post' do
    expect(page).to have_content('Comments: 2')
  end

  it 'shows the number of likes for the post' do
    expect(page).to have_content('Likes: 3')
  end

  it 'shows the body of the post' do
    expect(page).to have_content('Comment allez vous?')
  end

  it 'shows the username of each commentor' do
    expect(page).to have_content(@tom.name)
  end

  it 'shows comment of each commentor' do
    expect(page).to have_content('I really like Boostrap')
  end
end
