class DoctorsController < ApplicationController

	def home
		@user = User.new
	end

	def index
		if !current_user
			redirect_to home_path
			return
		end
		# @doctors = Doctor.where(user_id: current_user.id)
		@doctors = current_user.doctors 
	end

	def new
		if !current_user
			redirect_to new_session_path
			return
		end
		@doctor = Doctor.new
	end

	def create
		if !current_user
			redirect_to new_session_path
			return
		end
		# Make a new doctor object that is attached to the user
		decision = current_user.doctors.new(
			params.require(:doctor).permit(:first_name, :last_name, :email, :password_digest)
			)
		if doctor.save
			redirect_to doctors_path
		end
	end

	def destroy
		Doctor.find(params[:id]).destroy
		redirect_to doctors_path
	end
end
