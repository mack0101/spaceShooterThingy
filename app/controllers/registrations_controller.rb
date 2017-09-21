class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
  	if User.last.nickname.downcase.include? 'blade'
  		banned_path
  	end
  	root_path
  end
end