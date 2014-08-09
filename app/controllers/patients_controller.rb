class PatientsController < ApplicationController
	before_action :get_doctor, :check_security

	def index
		@patients = Patient.all
	end

	def show
		@patient = Patient.find(params[:id])
	end

	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new(
			params.require(:patient).permit(:first_name, :last_name, :sex, :DOB)
			) 
		if @patient.save 
			redirect_to doctor_patients_path(@doctor.id)
		else 
			render 'new' 
		end  
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update_attributes(params.require(:patient).permit(:first_name, :last_name, :sex, :DOB))
			redirect_to doctor_patients_path(@doctor.id)
		else 
			render 'edit'
		end
	end

	def destroy
		Patient.find(params[:id]).destroy
		redirect_to doctor_patients_path(@doctor.id)
	end

private

	def get_doctor
		@doctor = Doctor.find(params[:doctor_id])
	end

	def check_security
		if (!current_user) || (@doctor.user != current_user)
			redirect_to home_path
		end
	end
	
end
