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
    Doctor.find doctor_ids
  end

  def doctor_ids
    doctor_ids_array = []
    self.patient_doctors.each do |one_patient_doctor|
      if one_patient_doctor.doctor_id
        doctor_ids_array.push one_patient_doctor.doctor_id
      end
    end
    doctor_ids_array
  end

  def doctor_ids=(list)
    self.patient_doctors.destroy 
    list.each do |doctor_id|
      self.patient_doctors.create(doctor_id: doctor_id) unless doctor_id.blank?
    end
  end

  def doctor_list
    doctors_string = ""
    doctors.each do |one_doctor|
      doctors_string += ", " + one_doctor.first_name + " " + one_doctor.last_name
    end
    doctors_string.slice(2, doctors_string.length - 1)
    doctors_string
  end

end
