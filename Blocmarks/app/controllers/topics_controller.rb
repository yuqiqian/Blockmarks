class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic
      flash[:notice] = "Topic was created"
    else
      flash[:error] = "There is an error. Please try again"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted"
      redirect_to :topics
    else
      flash[:error] = "Error. Please try again"
      render :show
    end
  end
  
end
