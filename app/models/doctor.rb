class Doctor < User 

  field :specialty, type: String
  field :location, type: String

  has_many :patient_doctors
  accepts_nested_attributes_for :patient_doctors
  has_many :med_prescribed_bys
  accepts_nested_attributes_for :med_prescribed_bys

  def patients
    Patient.find(patient_ids)
  end

  def patient_ids
    ret = []
    self.patient_doctors.each do |r|
      ret << r.patient_id if r.patient_id
    end
    ret
  end

  def patient_ids=(list)
    self.save
    self.patient_doctors.destroy
    list.each do |patient_id|
      self.patient_doctors.create(patient_id: patient_id) unless patient_id.blank?
    end
  end

  def medications
    Medication.find(medication_ids)
  end

  def medication_ids
    medication_ids_array = []
    self.med_prescribed_bys.each do |one_med_prescribed_by|
      if one_med_prescribed_by.medication_id
        medication_ids_array.push one_med_prescribed_by.medication_id
      end
    end
    medication_ids_array
  end

  def medication_ids=(list)
    self.med_prescribed_bys.destroy
    list.each do |medication_id|
      self.med_prescribed_bys.create(medication_id: medication_id) unless medication_id.blank?
    end
  end

  def medication_list
    medications_string = ""
    medications.each do |one_medication|
      medications_string += ", " + one_medication.name 
    end
    medications_string.slice(2, medications_string.length - 1)
    medications_string
  end

end
