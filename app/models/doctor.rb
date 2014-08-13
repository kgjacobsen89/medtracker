class Doctor 

	include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  has_many :patients 
  has_many :patient_medications

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates_presence_of :first_name, :last_name, :email

end
