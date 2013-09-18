class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
    # @owner = Owner.new
  end

  def create
    @blog = Blog.new(blog_params)
    # @owner = Owner.new(owner_params)
    if @blog.save
      @owner = Owner.new
      @owner[:user_id] = current_user.id
      @owner[:blog_id] = @blog.id
      if @owner.save
        redirect_to @blog, notice: 'Blog was successfully created.'
      end  
    else
      render action: 'new'
    end
  end

  def show
    set_blog
  end

  def edit
    set_blog
  end

  def update
    set_blog

    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def destroy    
    if set_blog.destroy
      redirect_to blogs_path, notice: 'Blog deleted.'
    else
      render action: 'index'
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit([:name, :description])
    end

    def owner_params
      params.require(:owner).permit([:user_id, :blog_id])
    end
end
