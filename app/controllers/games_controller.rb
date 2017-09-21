class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_blade
  
  def index
  end

  private 

  def check_blade
  	if user_signed_in?
	  	if current_user.nickname.downcase.include? 'blade'
	  		current_user.update banned: true
	  		redirect_to banned_path
	  	end
	  end
  end
end
