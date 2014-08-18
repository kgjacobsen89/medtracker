class Patient < User

  field :sex, type: String
  field :DOB, type: Date
  field :blood_type, type: String

  has_many :patient_medications
  accepts_nested_attributes_for :patient_medications
  has_many :patient_doctors
  accepts_nested_attributes_for :patient_doctors

  def medications
    Medication.find medication_ids
  end

  def medication_ids
    medication_ids_array = []
    self.patient_medications.each do |one_patient_medication|
      if one_patient_medication.medication_id
        medication_ids_array.push one_patient_medication.medication_id
      end
    end
    medication_ids_array
  end

  def medication_ids=(list)
    self.patient_medications.destroy
    list.each do |medication_id|
      self.patient_medications.create(medication_id: medication_id) unless medication_id.blank?
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


  def doctors
    Doctor.find(doctor_ids)
  end

  def doctor_ids
    ret = []
    self.patient_doctors.each do |r|
      ret << r.doctor_id if r.doctor_id
    end
    ret
  end

  def doctor_ids=(list)
    self.save
    self.patient_doctors.destroy
    list.each do |doctor_id|
      self.patient_doctors.create(doctor_id: doctor_id) unless doctor_id.blank?
    end
  end
end

