class SessionsController < ApplicationController
	
	def new
		# Present an empty login form
		@user = User.new
		@is_login = true
	end

	def create
		# Find the user that is trying to log in		
		@user = User.where(email: params[:user][:email]).first
		if @user && @user.authenticate(params[:user][:password]) && @user.user_type == 'Doctor'
			# Store as a cookie in the Users' browser his/her ID,
			# indicating that they are logged in
			session[:user_id] = user.id.to_s
			redirect_to user_doctor_path(@user.id)
		elsif @user && @user.authenticate(params[:user][:password]) && @user.user_type == 'Patient'
			# Store as a cookie in the Users' browser his/her ID,
			# indicating that they are logged in
			session[:user_id] = user.id.to_s
			redirect_to user_patient_path(@user.id)
		else
			# Go back to the login page
			redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		redirect_to new_user_path
	end

end
