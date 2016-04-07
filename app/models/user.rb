class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :templates
  has_many :documents

  after_create :send_sign_up_email

  def send_sign_up_email
	UserMailer.sign_up(id).deliver_later
  UserMailer.new_sign_up(id).deliver_later
  end

  before_destroy :send_delete_email

  def send_delete_email
    UserMailer.deleted(id).deliver_later
    UserMailer.account_deleted(id).deliver_later
  end
end
