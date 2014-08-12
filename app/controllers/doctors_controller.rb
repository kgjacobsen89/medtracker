class DoctorsController < ApplicationController
	before_action :current_user

	def home
	end

	def index
		@doctors = Doctor.all
	end

	def new
		if @patient_user 
			redirect_to root_path
		elsif @doctor_user
		@doctor = Doctor.new
		else
		redirect_to root_path
		end	
	end

	def create
		@doctor = Doctor.new(params.require(:doctor).permit(:first_name, :last_name, :email,
		 :password, :password_confirmation))
		@doctor.doctor = true
		if @doctor.save
			redirect_to doctor_path(@doctor.id)
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
