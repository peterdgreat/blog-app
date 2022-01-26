class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    post = current_user.posts.new(post_params)
    user = current_user

    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'post saved successfully'
          redirect_to posts_index_url(user.id)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
