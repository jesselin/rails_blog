class PostsController < ApplicationController
  def index
    set_blog
    @posts = Post.all
  end

  def new
    set_blog
    @post = Post.new
  end

  def create
    set_blog
    @post = Post.new(post_params)
    @post[:user_id] = current_user.id
    @post[:blog_id] = set_blog.id
    if @post.save
      redirect_to blog_path(@blog), notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    set_blog
    set_post
  end

  def edit
    set_blog
    set_post
  end

  def update
    set_post
    set_blog
    if @post.update(post_params)
      redirect_to blog_path(@blog), notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def destroy
    @blog = Blog.find(set_post.blog)
    if set_post.destroy
      redirect_to blog_path(@blog), notice: 'Post deleted.'
    else
      render action: 'index'
    end
  end

  private

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit([:title, :content, :blog_id, :user_id])
    end

end
