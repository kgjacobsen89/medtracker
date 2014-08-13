class DoctorsController < ApplicationController
	# before_action :current_user

	def home
	end

	def index
		@doctors = Doctor.all
	end

	def new
		@doctor = Doctor.new
	end

	def create
		@doctor = Doctor.new(params.require(:doctor).permit(:first_name, :last_name, :email,
		 :password, :password_confirmation))
		if @doctor.save
			redirect_to new_session_path
		else
			render 'new'
		end
	end

	def show
		@doctor = Doctor.find(params[:id])
	end

	def destroy
		Doctor.find(params[:id]).destroy
		redirect_to root_path
	end
	
end
