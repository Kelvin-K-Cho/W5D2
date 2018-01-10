class PostsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_ids = [params[:sub_id]]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      @subs = Sub.all
      render :new
    end
  end

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
    render :edit
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub)
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post && @post.update(post_params)
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = ["Invalid params"]
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
