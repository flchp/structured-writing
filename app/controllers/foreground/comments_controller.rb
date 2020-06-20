class Foreground::CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    @comment.save
    #评论跳转不增加阅读量
    @post.post_read_amount -= 1
    @post.save
    redirect_to foreground_post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit( :comment)
  end
end
