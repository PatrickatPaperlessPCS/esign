class Template < ActiveRecord::Base


  has_attached_file :attachment1, styles: { image: ["1125x1500", :png] }, default_url: "/images/missing.png",:convert_options => { density: "1050", quality: "100" }
  validates_attachment_content_type :attachment1, content_type: [/image/, "application/pdf"]

belongs_to :user

  validate :template_count_within_limit, :on => :create

  def template_count_within_limit
    if self.user.templates(:reload).count >= 10
      errors.add(:base, "Exceeded template limit contact us at support@esignhealth.com to upgrade")
    end
  end
end
