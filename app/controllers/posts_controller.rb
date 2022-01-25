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

  # def new
  #   post = Post.new
  #   respond_to do |format|
  #     format.html { render :new, locals: { post: @post } }
  #   end
  # end

  # def create
  #   post = Post.new(params.require(:post).permit(:title, :text))
  #   post.comments_counter = 0
  #   post.likes_counter = 0
  #   respond_to do |format|
  #     format.html do
  #       if post.save
  #         puts 'Post saved'

  #       else
  #         puts 'Something went wrong'

  #       end
  #     end
  #   end
  # end
  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    user = User.find(params[:user_id])
    post.author = user
    post.comments_counter = 0
    post.likes_counter = 0
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
end
