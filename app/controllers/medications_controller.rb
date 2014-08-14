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
		@medication = Medication.new(params.require(:medication).permit(:name, :dosage, :periodicity, :duration)) 
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
		@medication = @patient.Medication.find(params[:id])
		if @medication.update_attributes(params.require(:medication).permit(:name, :dosage, :periodicity, :duration))
			redirect_to user_medications_path(@user.id)
		else 
			render 'edit'
		end
	end

	def destroy
		@medication = Medication.find(params[:id]).destroy 
		redirect_to user_medications_path(@user.id)
	end
end


