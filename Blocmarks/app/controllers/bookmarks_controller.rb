class BookmarksController < ApplicationController
  include ApplicationHelper
  def show
  end

  def new
  end

  def edit
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @user = current_user
    @bookmark = @topic.bookmarks.build(params.require(:bookmark).permit(:url))
    @bookmark.image = get_embed_image(@bookmark.url)
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
    else
      flash[:error] = "Error. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted."
    else
      flash[:error] = "Error. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
