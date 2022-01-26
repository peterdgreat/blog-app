class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: comment } }
    end
  end

  def create
    comment = Comment.new(comment_params)
    post = Post.find(params[:post_id])
    user = current_user
    comment.author = user
    comment.post = post
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'comment saved successfully'
          redirect_to user_post_url(user.id, post.id)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          render :new, locals: { comment: comment }
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
