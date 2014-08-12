class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user

  def current_user
  	if session[:doctor_id]
  		@doctor_user ||= Doctor.find(session[:doctor_id]) 
  	elsif session[:patient_id]
  		@patient_user ||= Patient.find(session[:patient_id]) 
  	end
	end

end
