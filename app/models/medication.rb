class Medication

  include Mongoid::Document

  field :name, type: String
  field :prescribedby, type: String

  has_many :patient_medications
  has_many :med_prescribed_bys

  def doctors
    Doctor.find doctor_ids
  end

  def doctor_ids
    doctor_ids_array = []
    self.med_prescribed_bys.each do |one_med_prescribed_by|
      if one_med_prescribed_by.doctor_id
        doctor_ids_array.push one_med_prescribed_by.doctor_id
      end
    end
    doctor_ids_array
  end

  def doctor_ids=(list)
    self.med_prescribed_bys.destroy 
    list.each do |doctor_id|
      self.med_prescribed_bys.create(doctor_id: doctor_id) unless doctor_id.blank?
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
