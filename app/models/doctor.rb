class Doctor < User 

  field :speciality, type: String
  field :location, type: String

  has_many :patient_doctors
  accepts_nested_attributes_for :patient_doctors
  has_many :med_prescribed_bys
  accepts_nested_attributes_for :med_prescribed_bys

  def patient_medications
    PatientMedication.find patient_medication_ids
  end

  def patient_medication_ids
    patient_medication_ids_array = []
    self.med_prescribed_bys.each do |one_med_prescribed_by|
      if one_med_prescribed_by.patient_medication_id
        patient_medication_ids_array.push one_med_prescribed_by.patient_medication_id
      end
    end
    patient_medication_ids_array
  end

  def patient_medication_ids=(list)
    self.med_prescribed_bys.destroy
    list.each do |patient_medication_id|
      self.med_prescribed_bys.create(patient_medication_id: patient_medication_id) unless patient_medication_id.blank?
    end
  end

  def patient_medication_list
    patient_medications_string = ""
    patient_medications.each do |one_patient_medication|
      patient_medications_string += ", " + one_patient_medication.name 
    end
    patient_medications_string.slice(2, patient_medications_string.length - 1)
    patient_medications_string
  end

end
