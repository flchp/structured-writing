class Foreground::PostsController < ApplicationController

  def index
    @posts = Post.is_public.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @post.post_read_amount += 1
    @post.save
    @comment = Comment.new
    @comments = @post.comments.order("created_at DESC")
  end
end
