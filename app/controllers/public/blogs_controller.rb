class Public::BlogsController < ApplicationController
  
  def new
    @blog = Blog.new
    @genres = Genre.where(is_active: 'true')
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path
    else
      @genres = Genre.where(is_active: 'true')
      render "new"
    end
  end

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end

  def destroy
  end
  
  private

  def blog_params
    params.require(:blog).permit(:title, :body, :genre_id, :image)
  end
end
