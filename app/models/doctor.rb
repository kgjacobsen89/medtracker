class Doctor 
	include Mongoid::Document
  include ActiveModel::SecurePassword
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :doctor, type: Boolean

  has_secure_password

has_many :patients
end
