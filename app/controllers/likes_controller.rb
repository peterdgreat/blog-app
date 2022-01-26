class LikesController < ApplicationController
  def create
    user = current_user
    post = Post.find(params[:post_id])

    like = Like.new(author_id: user.id, post_id: post.id)
    if like.save
      flash.now[:message] = 'Like saved'
      redirect_to user_post_path(user.id, post.id)
    else
      flash.now[:error] = 'Error: Like could not be saved'
      render :new, locals: { like: like }
    end
  end
end
