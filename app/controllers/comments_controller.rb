def new
    @comment = Comment.new
end
def create
    @comment = Comment.new(params.require(:comment).permit(:text, :title))
    if @comment.save
      flash[:success] = "Comment successfully created"
      redirect_to @comment
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
end

