class MedicationsController < ApplicationController
	before_action :get_patient, :check_security

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
			redirect_to patient_medications_path(@patient.id)
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
			redirect_to patient_medications_path(@patient.id)
		else 
			render 'edit'
		end
	end

	def destroy
		@medication = Medication.find(params[:id]).destroy 
		redirect_to patient_medications_path(@patient.id)
	end

private

	def get_patient
		# Find our parent patient that we should attach to
		@patient = Patient.find(params[:patient_id])
	end

	def check_security
		# If they're not logged in or they don't own this medication, redirect to home page
		if (!current_user) || (@patient.user != current_user) || (@doctor.user) != current_user)
			redirect_to root_path
		end
	end
end


