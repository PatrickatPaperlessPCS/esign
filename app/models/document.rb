class Document < ActiveRecord::Base

belongs_to :user
has_many :dynamic_textfields
accepts_nested_attributes_for :dynamic_textfields
belongs_to :template

	before_create :add_token
		private
		def add_token
		  begin
		    self.authentication_token = SecureRandom.hex[0,10].upcase
		  end while self.class.exists?(authentication_token: authentication_token)
		end
end
