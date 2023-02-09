class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new(user: @user, post_id: params[:post_id])

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render json: { error: @like.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private

  def set_post; end
end
