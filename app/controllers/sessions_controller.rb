class SessionsController < ApplicationController
	
	def new
		# Present an empty login form
		@user = User.new
		@is_login = true
	end

	def create
		# Find the user that is trying to log in		
		if params[:user_type] == 'Doctor'
			@user = Doctor.where(username: params[:user][:username]).first
			if @user && @user.authenticate(params[:user][:password]) 
				# Store as a cookie in the Users' browser his/her ID,
				# indicating that they are logged in
				session[:user_id] = user.id.to_s
				redirect_to doctor_path(doctor_id: @user.id)
			else 
				# Go back to the login page
				redirect_to new_session_path
			end
		elsif params[:user_type] == 'Patient'
			@user = Patient.where(username: params[:user][:username]).first
			if @user && @user.authenticate(params[:user][:password]) 
				# Store as a cookie in the Users' browser his/her ID,
				# indicating that they are logged in
				session[:user_id] = user.id.to_s
				redirect_to patient_path(patient_id: @user.id)
			else
				# Go back to the login page
				redirect_to new_session_path
			end
		else
			redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		redirect_to new_user_path
	end

end
