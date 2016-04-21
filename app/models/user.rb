class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :firstName,presence: true
  validates :lastName,presence: true
  validates :streeAddress,presence: true
  validates :city,presence: true
  validates :province,presence: true
  validates :country,presence: true
  
  canadian_postal_code_validator = /^([a-zA-Z]\d[a-zA-z]( )?\d[a-zA-Z]\d)$/
  validates :postalCode, format: { with: canadian_postal_code_validator, :multiline => true}
  
  canadian_phone_validator = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  validates :contactNumber, format: { with: canadian_phone_validator, :multiline => true}
 

 
end
