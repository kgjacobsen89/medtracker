class PatientsController < ApplicationController
	before_action :check_security

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
		@patient = Patient.new(params.require(:patient).permit(:first_name, :last_name, :sex, :DOB, :doctor_id, :email, :password, :password_confirmation))
		if @patient.save 
			redirect_to patient_path(@patient.id)
		else 
			render 'new' 
		end  
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update_attributes(params.require(:patient).permit(:first_name, :last_name, :sex, :DOB, :doctor_id, :email, :password, :password_confirmation))
			redirect_to patient_path(@patient.id)
		else 
			render 'edit'
		end
	end

	def destroy
		Patient.find(params[:id]).destroy
		redirect_to patients_path
	end

private
	def get_doctor
		@doctor = Doctor.find(params[:doctor_id])
	end
	def check_security
		# If they're not logged in or they don't own this medication, redirect to home page
		if (!current_user) || (@doctor.patient != current_user) || (@patient) != current_user)
			redirect_to root_path
		end
	end
end
