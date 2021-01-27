class Public::BlogCommnetsController < ApplicationController
  def create
    blog = Blog.find(params[:blog_id])
    comment = current_user.blog_comments.new(blog_comment_params)
    comment.blog_id = blog.id
    comment.save
    redirect_to blog_path(blog)
  end

  def destroy
  end
  
  private

  def blog_comment_params
    params.require(:blog).permit(:comment)
  end
end
