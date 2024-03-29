class PostsController < ApplicationController
def index
    @posts = Post.all

     respond_to do |format|
    format.html  # index.html.erb
    format.json  { render :json => @posts }
  end
  end
 
  def show
    @post = Post.find(params[:id])
  end
 
  def new
    @post = Post.new
  end
 
  def edit
    @post = Post.find(params[:id])
  end
 
  def create
    @post = Post.new(post_params)
 
    respond_to do |format|
    if @post.save
      format.html  { redirect_to(@post,
                    :notice => 'Post was successfully created.') }
      format.json  { render :json => @post,
                    :status => :created, :location => @post }
    else
      format.html  { render :action => "new" }
      format.json  { render :json => @post.errors,
                    :status => :unprocessable_entity }
    end
    end
  end
 
  def update

    @post = Post.find(params[:id])
=begin
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
=end
    respond_to do |format|
    if @post.update_attributes(params[:post])
      format.html  { redirect_to(@post,
                    :notice => 'Post was successfully updated.') }
      format.json  { head :no_content }
    else
      format.html  { render :action => "edit" }
      format.json  { render :json => @post.errors,
                    :status => :unprocessable_entity }
    end
  end
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end
 
  private
    def post_params
      params.require(:post).permit(:title, :description)
    end
end
