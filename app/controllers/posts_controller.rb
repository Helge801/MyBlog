class PostsController < ApplicationControllor

  def new
    @post = Blog.find(params[:id]).post.new #TODO: May need refactoring
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post.blog # TODO: may need refactoring
    end
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to @post.blog # TODO: may need refactoring
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post.blog # TODO: may need refactoring
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :blog_id)
  end


end