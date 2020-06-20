class Account::PostsController < ApplicationController

  before_action :authenticate_user!, except: :show

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      if @post.post_model
        redirect_to edit_account_post_path(@post)
      else
        redirect_to account_posts_path
      end
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to account_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "post deleted"
    redirect_to account_posts_path
  end

  def set_as_private
    @post = Post.find(params[:id])
    @post.is_set_as_private = true
    @post.save
    redirect_to :back
  end

  def quit_set_as_private
    @post = Post.find(params[:id])
    @post.is_set_as_private = false
    @post.save
    redirect_to :back
  end

  def set_as_model
    @post = Post.find(params[:id])
    @post.is_set_as_model = true
    @post.save
    redirect_to :back
  end

  def quit_set_as_model
    @post = Post.find(params[:id])
    @post.is_set_as_model = false
    @post.save
    redirect_to :back
  end

  def select_model_new
    @post = Post.new
    @my_post_models = current_user.posts.is_model
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :is_set_as_private, :is_set_as_model, :post_model_id)
  end

end
