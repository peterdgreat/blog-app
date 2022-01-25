class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html do
        render :new, locals: { comment: comment }
      end
    end
  end

  def create
    comment = Comment.new(params.require(:comment).permit(:text, :title))
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
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
end
