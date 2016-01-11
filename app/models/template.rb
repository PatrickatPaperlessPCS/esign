class Template < ActiveRecord::Base


  has_attached_file :attachment1, styles: { image: ["3000x3000>", :png] }, default_url: "/images/missing.png"
  validates_attachment_content_type :attachment1, content_type: [/image/, "application/pdf"]

belongs_to :user
end
