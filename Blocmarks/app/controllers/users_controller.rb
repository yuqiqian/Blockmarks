class UsersController < ApplicationController
  def show
    @topics = current_user.topics
    @liked_bookmarks = []
    current_user.likes.each do |like|
      @liked_bookmarks << like.bookmark
    end
    
  end
end
