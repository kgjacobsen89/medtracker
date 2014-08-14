class Medication

  include Mongoid::Document

  field :name, type: String
  field :dosage, type: String
  field :periodicity, type: String
  field :duration, type: Integer

  validates_presence_of :name, :dosage, :periodicity, :duration

  has_many :patient_medications
  
end
