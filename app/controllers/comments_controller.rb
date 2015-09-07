class CommentsController < ApplicationController
def index
    @comments = Comment.all
  end
 
  def show
    @comment = Comment.find(params[:id])
  end
 
  def new
    @comment = Comment.new
  end
 
  def edit
    @comment = Comment.find(params[:id])
  end
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
 
  def update
    @comment = Comment.find(params[:id])
 
    if @comment.update(post_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
 
    redirect_to posts_path
  end
 
  private
    def comment_params
      params.require(:comment).permit(:name, :note)
    end
end
