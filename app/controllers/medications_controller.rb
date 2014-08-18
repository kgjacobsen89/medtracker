class MedicationsController < ApplicationController

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
		@medication = Medication.new(medication_params) 
		if @medication.save 
			redirect_to user_medications_path(@user.id)
		else 
			render 'new' 
		end  
	end

	def edit
		@medication = Medication.find(params[:id])
	end

	def update
		@medication = Medication.find(params[:id])
		if @medication.update_attributes(medication_params)
			redirect_to user_medications_path(@user.id)
		else 
			render 'edit'
		end
	end

	def destroy
		@medication = Medication.find(params[:id]).destroy 
		redirect_to user_medications_path(@user.id)
	end

	private

	def medication_params
		params.require(:medication).permit(
			:name, :dosage, :periodicity, :duration, :start_date, :end_date, :prescribedby, :doctor_ids => [] )

end


