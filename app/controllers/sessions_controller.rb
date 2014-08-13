class SessionsController < ApplicationController
	
	def new
		# Present an empty login form
		@patient = Patient.new
		@doctor = Doctor.new
		@is_login = true
	end

	def create
		# Find the user that is trying to log in
		if @patient != nil		
			p = Patient.where(email: params[:patient][:email]).first
			if p && p.authenticate(params[:patient][:password])
				# Store as a cookie in the Users' browser the ID of them,
				# indicating that they are logged in
				session[:patient_id] = p.id.to_s
				redirect_to patient_path(@patient.id)
			else
				# Go back to the login page
				redirect_to new_session_path
			end
		else
			if @doctor != nil		
				d = Doctor.where(email: params[:doctor][:email]).first
				if d && d.authenticate(params[:doctor][:password])
					# Store as a cookie in the Users' browser the ID of them,
					# indicating that they are logged in
					session[:doctor_id] = d.id.to_s
					redirect_to doctor_path(@doctor.id)
				else
					# Go back to the login page
					redirect_to new_session_path
				end
			end
		end
	end

	def destroy
		reset_session
		redirect_to home_path
	end
end
