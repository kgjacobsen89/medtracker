class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
  field :phone_number, type: String
  field :password_digest, type: String  
end
