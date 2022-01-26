class LikesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    like = Like.new(author_id: user.id, post_id: post.id)
    if like.save && post.update_attribute(:likes_counter, post.likes_counter + 1)
      puts 'Like saved'
      flash.now[:message] = 'Like saved'
      redirect_to user_post_path(user.id, post.id)
    else
      puts 'Error'
      flash.now[:error] = 'Error: Like could not be saved'
      render :new, locals: { like: like }
    end
  end
end
