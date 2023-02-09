class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new(author: @user, post_id: params[:post_id])

    @like.author_id = @user.id
    @like.post_id = params[:post_id]
    redirect_to user_post_path(@user, @post) if @like.save
  end

  private

  def set_post; end
end
