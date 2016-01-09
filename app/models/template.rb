class Template < ActiveRecord::Base


  has_attached_file :attachment1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment1, content_type: /\Aimage\/.*\Z/

belongs_to :user
end
