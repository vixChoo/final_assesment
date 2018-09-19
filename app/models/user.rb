class User < ApplicationRecord
	has_secure_password
	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	# Association
	has_many :authentications, dependent: :destroy

	

	def self.create_with_auth_and_hash(authentication, auth_hash)
	user = self.create!(
		name: auth_hash["info"]["name"],
		email: auth_hash["info"]["email"],
		password: SecureRandom.hex(10)
	)
	user.authentications << authentication
	return user
	end

	# grab google to access google for user data
	def google_token
		x = self.authentications.find_by(provider: 'google_oauth2')
		return x.token unless x.nil?
	end

end

