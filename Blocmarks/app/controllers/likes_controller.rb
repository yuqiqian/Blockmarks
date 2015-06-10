class LikesController < ApplicationController
  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
 
     if like.save
       flash[:notice] = "You like the bookmark!"
     else
       flash[:error] = "Error. Please try again."
     end
     redirect_to @bookmark.topic
   end

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.where(bookmark_id: @bookmark.id).first
     if like.destroy
       flash[:notice] = "You unlike the bookmark!"
     else
       flash[:error] = "Error. Please try again."
     end
     redirect_to @bookmark.topic
   end

end
