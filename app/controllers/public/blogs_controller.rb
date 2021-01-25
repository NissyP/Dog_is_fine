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
    @genres = Genre.where(is_active: true)
    if params[:genre_id].blank?
  		@blogs = Blog.all
    else
  	  @genre = Genre.find(params[:genre_id])
  		@blogs = @genre.blogs.all
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
    @blog = Blog.find(params[:id])
    @genres = Genre.where(is_active: 'true')
    if @blog.user != current_user
      redirect_to blogs_path
    end
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render "edit"
    end
  end

  def destroy
  end
  
  private

  def blog_params
    params.require(:blog).permit(:title, :body, :genre_id, :image, :start_time)
  end
end
