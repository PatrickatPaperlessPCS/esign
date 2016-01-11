class Template < ActiveRecord::Base


  has_attached_file :attachment1, styles: { image: ["768x900", :png] }, default_url: "/images/missing.png",:convert_options => { density: "1050", quality: "100" }
  validates_attachment_content_type :attachment1, content_type: [/image/, "application/pdf"]

belongs_to :user
end
