class Document < ActiveRecord::Base

belongs_to :user

has_one :template

	before_create :add_token
		private
		def add_token
		  begin
		    self.authentication_token = SecureRandom.hex[0,10].upcase
		  end while self.class.exists?(authentication_token: authentication_token)
		end
end
