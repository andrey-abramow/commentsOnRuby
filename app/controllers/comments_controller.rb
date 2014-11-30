class CommentsController < ApplicationController
  def destroy
    @comments  = Comment.all

    @comment = Comment.find(params[:id])
    @comment.destroy
    @comment  = Comment.new

    redirect_to comments_path

  end

  def index
    @comment  = Comment.new
    @comments  = Comment.all
   end

  def create
    @comments  = Comment.all

    @comment = Comment.new(comment_params)
      if  @comment.save
        @comment = Comment.new
        redirect_to comments_path
      end
  end
  private
  def comment_params
    params.require(:comment).permit(:author, :text)
  end

end
