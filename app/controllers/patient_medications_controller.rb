class PatientMedicationsController < ApplicationController

	def index
		@patient_medications = PatientMedication.all
		@patient_medication = PatientMedication.new
	end

	def create
		patient_medication = PatientMedication.create(params.require(:patient_medication).permit(:patient_id, :medication_id))
		redirect_to patient_medications_path
	end
end