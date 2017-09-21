class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :check_banned, except: [:banned]
  before_action :check_blade, except: [:banned]

  protected

  def configure_permitted_parameters
    logger.info("DEVISE CONTROLLER\n")
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    logger.info(devise_parameter_sanitizer)
  end

  def check_banned
  	if user_signed_in? && current_user.banned
  		redirect_to banned_path
  	end
  end

  def check_blade
  	if user_signed_in?
	  	if current_user.nickname.downcase.include? 'blade'
	  		current_user.update banned: true
	  	end
	  end
  end
end
