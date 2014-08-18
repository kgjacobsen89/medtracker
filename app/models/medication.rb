class Medication

  include Mongoid::Document

  field :name, type: String
  field :dosage, type: String
  field :periodicity, type: String
  field :duration, type: Integer
  field :prescribedby, type: String

  validates_presence_of :name, :dosage, :periodicity, :duration, :prescribedby

  has_many :patient_medications
  
end
