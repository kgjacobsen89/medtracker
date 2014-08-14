class DoctorsController < ApplicationController

	def index
		@doctors = Doctor.all
	end

	def new
		@doctor = Doctor.find(params[:doctor_id])
	end

	def create
		@doctor = Doctor.new(doctor_params)
		if @doctor.save
			redirect_to user_doctor_path(@user.id)
		else
			render 'new'
		end
	end

	def show
		@doctor = Doctor.find(params[:id])
	end

	def edit
		@doctor = Doctor.find(params[:id])
	end

	def update
		@doctor = Doctor.find(params[:id])
		if @doctor.update_attributes(doctor_params)
			redirect_to user_doctor_path(@user.id)
		else 
			render 'edit'
		end
	end

	def destroy
		Doctor.find(params[:id]).destroy
		redirect_to root_path
	end

	private
	def doctor_params 
		params.require(:patient).permit(
			:speciality, :location, :email, patient_medication_ids: [])
	end

	
end
