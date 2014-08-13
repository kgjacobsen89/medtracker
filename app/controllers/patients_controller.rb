class PatientsController < ApplicationController

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
		@patient = Patient.new(params.require(:patient).permit(:first_name, :last_name, :sex, :DOB, :email, :password, :password_confirmation))
		if @patient.save 
			redirect_to new_session_path
		else 
			render 'new' 
		end  
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update_attributes(params.require(:patient).permit(:first_name, :last_name, :sex, :DOB, :email, :password, :password_confirmation))
			redirect_to patient_path(@patient.id)
		else 
			render 'edit'
		end
	end

	def destroy
		Patient.find(params[:id]).destroy
		redirect_to patients_path
	end

end
