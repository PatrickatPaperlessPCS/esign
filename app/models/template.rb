class Template < ActiveRecord::Base


  has_attached_file :attachment1, styles: { image: ["1125x", :png] }, default_url: "/images/missing.png",:convert_options => { density: "1050", quality: "1050" }
  validates_attachment_content_type :attachment1, content_type: [/image/, "application/pdf"], path: '/templates', url: '/templates'

belongs_to :user
has_one :signature_position
accepts_nested_attributes_for :signature_position


  validate :template_count_within_limit, :on => :create

  def template_count_within_limit
    if self.user.templates(:reload).count >= 10
      errors.add(:base, "Exceeded template limit contact us at support@esignhealth.com to upgrade")
    end
  end
end
