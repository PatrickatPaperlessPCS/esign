class DocumentMailer < ApplicationMailer
  default :from => 'info@paperlesspcs.com'


def email(document)
	@document = document
     mail(
  :subject => 'Critical Documentation Needed' ,
  :to  => @document.recipient ,
  :track_opens => 'true'
)
  end
end
