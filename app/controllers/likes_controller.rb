class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(author: current_user, post_id: params[:post_id])
    @user = current_user
    @post = Post.find(params[:post_id])

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render json: { error: @like.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private

  def set_post; end
end
