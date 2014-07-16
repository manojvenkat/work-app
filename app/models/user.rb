class User < ActiveRecord::Base

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
#	after_save :clear_password

	attr_accessible :name, :email, :password, :password_confirmation	
	# has_secure_password
	validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :email, :presence => true, :uniqueness => true
	validates_format_of :email, :with => /@/	
	validates :password, :presence => true, :length => { :in => 6..20 }
	validates :password, :confirmation => true

	has_many :user_groups, dependent: :destroy
	
	def isEmail(str)
  		return str.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]\.)[a-zA-Z]{2,4}/)
	end

	def self.authenticate(name_or_email="", login_password="")
		if isEmail(name_or_email)
			user = User.find_by_email(name_or_email)
		else
			user = User.find_by_name(name_or_email)
		end

		if user && user.password == login_password
			return user
		else
			return false
		end
	end

	def self.authenticate(login_password="")
		if self.password == login_password
			return true
		else
			return false
		end
	end

	def isMember?(group_id)
		##Verify if the person is a member of the group?
	end

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end

end
