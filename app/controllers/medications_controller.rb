class MedicationsController < ApplicationController
	before_action :get_patient
	before_action :current_user

	def index
		@medications = Medication.all
	end

	def show
		@medication = Medication.find(params[:id])
	end

	def new
		@medication = Medication.new
	end

	def create
		@patient = @doctor.patient.where(id: patient.id)
		@medication = @patient.Medication.new(params.require(:medication).permit(:name, :dosage, :periodicity, :duration)) 
		if @medication.save 
			redirect_to doctor_patient_medications_path(@patient.id)
		else 
			render 'new' 
		end  
	end

	def edit
		@medication = Medication.find(params[:id])
	end

	def update
		@patient = @doctor.patient.where(id: patient.id)
		@medication = @patient.Medication.find(params[:id])
		if @medication.update_attributes(params.require(:medication).permit(:name, :dosage, :periodicity, :duration))
			redirect_to doctor_patient_medications_path(@patient.id)
		else 
			render 'edit'
		end
	end

	def destroy
		@medication = Medication.find(params[:id])
		@medication.destroy 
		redirect_to doctor_patient_medications_path(@patient.id)
	end

private

	def get_patient
		@patient = Patient.find(params[:patient_id])
	end
	
end


