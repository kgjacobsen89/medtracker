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
		@patient= Patient.new(params.require(:patient).permit(:first_name, :last_name, :sex, :DOB)) 
		if @patient.save 
			redirect_to patients_path
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
			redirect_to patients_path
		else 
			render 'edit'
		end
	end
	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy 
		redirect_to patients_path
	end
end
