class PatientMedicationsController < ApplicationController

	def index
		@patient_medications = PatientMedication.all(order_by :name)
	end

	def show
		@patient_medication = PatientMedication.find(params[:id])
	end

	def new
		@patient_medication = PatientMedication.find(params[:patient_medication_id])
	end

	def create
		@patient_medication = PatientMedication.new(patient_medication_params)
		if @patient_medication.save
			redirect_to patient_path
		else
			render 'new'
		end
	end

	def edit
		@patient_medication = PatientMedication.find(params[:id])
	end

	def update
		@patient_medication = PatientMedication.find(params[:id])
		if @patient_medication.update_attributes(patient_medication_params)
			redirect_to patient_path
		else
			render 'edit'
		end
	end

	def destroy
		PatientMedication.find(params[:id]).destroy
		redirect_to user_medications_path
	end

	private

	def patient_medication_params
		params.require(:patient_medication).permit(
			:dosage, :periodicity, :duration, :start_date, :end_date)
	end
end
