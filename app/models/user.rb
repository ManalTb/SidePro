require 'digest'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation

	email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :name,	:presence	=> true,
			  :length				=> { :maximum => 50 }
	validates :email,	:presence	=> true,
			  :format				=> { :with => email_regex },
			  :uniqueness			=> { :case_sensitive => false }

	validates :password, :presence	=> true,
			  :confirmation 		=> true,
			  :length				=> { :within => 6..40 }

	before_save :encrypted_password

	def has_password?(submitted_password)
		encrypted_password = encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)

		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	private
		def encrypted_password
			self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if new_record?

			self.encrypted_password = encrypt(password)
		end

		def encrypt(pass)
			Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
		end

end
