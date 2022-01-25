def create
    user = User.find(params[:user_id])
    post = Post.find(params[:id])
    like = Like.new(user: user, post: post)

    like.save
    redirect_to user_post_url(user.id)
end
