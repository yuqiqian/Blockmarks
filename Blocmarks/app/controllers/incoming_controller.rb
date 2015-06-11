class IncomingController < ApplicationController
  require 'faker'
  skip_before_action :verify_authenticity_token, only:[:create]

  def create
    email = params[:sender]
    subject = params[:subject]
    @user = User.find_by_email(email)
    @topic = Topic.find_by_title(subject)
    #@url = params["body-plain"]

    if @user == nil
      @user = User.new(email: email, password: Faker::Lorem.characters(8))
      @user.skip_confirmation!
      @user.save!
    end

    if @topic == nil
      @topic = Topic.new(title: subject, user: @user)
      @topic.save!
    end

    head 200
  end
end
