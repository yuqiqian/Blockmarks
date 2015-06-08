class TopicPolicy < ApplicationPolicy
  def index?
   true
  end 

  def create? 
    user.present?  
  end 

  def update? 
    create? 
  end 
  
  def destory?
    update?
  end
  
  def show?
    true
  end
  
end