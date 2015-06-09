class IncomingController < ApplicationController
  require 'faker'
  skip_before_action :verify_authenticity_token, only:[:create]

  def create
    
    @user = User.find_by_email(params[:sender])
    @topic = Topic.find_by_title(params[:subject])
    #@url = params["body-plain"]

    if @user == nil
      @user = User.new(email: params[:sender], password: Faker::Lorem.characters(8))
      @user.skip_confirmation!
      @user.save!
    end

    if @topic == nil
      @topic = Topic.new(title: params[:subject], user: @user)
      @topic.save!
    end

    head 200
  end
end
