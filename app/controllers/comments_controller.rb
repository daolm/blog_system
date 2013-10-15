class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def show
    
  end

  def create
    @micropost = Micropost.find(params[:comment][:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @micropost
    else
      @feed_items = []
      flash[:error] = "Name and content of comment can't be empty!"
      redirect_to @micropost
    end
  end

  def destroy

  end

  private

    def comment_params
      params.require(:comment).permit(:name, :content, :micropost_id)
    end
end