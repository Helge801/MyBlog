class CommentsController < ApplicationController

def create
  @comment = Comment.new(comment_params)
end

def update
  @comment = Comment.find(params[:id])
  @comment.update(comment_params)
end

def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
end

private

def comment_params
  params.require(:comment).permit(:body, :user_id, :blog_id)
end


end