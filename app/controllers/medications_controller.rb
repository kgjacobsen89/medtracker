class MedicationsController < ApplicationController

	def index
		@medications = Medication.all
	end

	def show
		@medication = Medication.find(params[:id])
	end

	def new
		@medication = Medication.new
		@patient = Patient.find(session[:user_id])
	end

	def create
		@medication = PatientMedication.new(medication_params)
		if @medication.save 
			redirect_to new_user_patient_medication_path(patient_medication_id: @medication.id)
		else 
			render 'new' 
		end  
	end

	def destroy
		@medication = Medication.find(params[:id]).destroy 
		redirect_to user_medications_path(@user.id)
	end

	private

	def medication_params
		params.require(:medication).permit(
			:name, :doctor_ids => [])
	end
end


