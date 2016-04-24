class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
 has_many :orders
 has_many :books
=======
         
  has_many :orders, dependent: :destroy
  has_many :books, dependent: :destroy
  
  validates :firstName,presence: true, :length => { :minimum => 3}
  validates :lastName,presence: true, :length => { :minimum => 3}
  validates :streeAddress,presence: true, :length => { :minimum => 3}
  validates :city,presence: true, :length => { :minimum => 3}
  validates :province,presence: true, :length => { :minimum => 2}
  validates :country,presence: true, :length => { :minimum => 2}
  
  validates :userId,presence: true
  
  canadian_postal_code_validator = /^([a-zA-Z]\d[a-zA-z]( )?\d[a-zA-Z]\d)$/
  validates :postalCode, format: { with: canadian_postal_code_validator, :multiline => true}
  
  canadian_phone_validator = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  validates :contactNumber, format: { with: canadian_phone_validator, :multiline => true}
>>>>>>> Bamidele_Workspace
end
