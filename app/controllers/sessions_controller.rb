class SessionsController < ApplicationController
	
	def new
		# Present an empty login form
		@user = User.new
	end

	def create
		# Find the user that is trying to log in		
		@user = User.where(username: params[:user][:username]).first
		if @user && @user.authenticate(params[:user][:password])
			# Store as a cookie in the users' browser the ID of them,
			# indicating that they are logged in
			session[:user_id] = u.id.to_s
			if @user._type == 'Patient'
				redirect_to patient_path(patient_id: @user.id)
			elsif @user._type == 'Doctor'
				redirect_to doctor_path(doctor_id: @user.id)
			end
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
