class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    p params
    if comment.save
      redirect_to article_path(params[:article_id].to_i)
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body, :author, :article_id)
  end

end
