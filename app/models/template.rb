class Template < ActiveRecord::Base
  require 'blitline'

  has_attached_file :attachment1, default_url: "/images/missing.png"
  

  validates_attachment_content_type :attachment1, content_type: [/image/, "application/pdf"], path: '/templates', url: '/templates'

  belongs_to :user
  has_one :signature_position
  accepts_nested_attributes_for :signature_position

  after_create :creation_email, :blitline_job
  after_update :update_email



  def creation_email
    UserMailer.creation_email(user_id).deliver_later
  end

  def update_email
    UserMailer.update_email(user_id).deliver_later
  end

  validate :template_count_within_limit, :on => :create

  def template_count_within_limit
    if self.user.templates(:reload).count >= 100
      errors.add(:base, "Exceeded template limit contact us at support@esignhealth.com to upgrade")
    end



#    def run_blitline_job
#      filename = File.basename(image, '.*')
#      # self.title ||= sanitize_filename(filename).titleize # set default name based on filename

#      filename_with_ext = File.basename(image)
#      key = "uploads/thumbnails/#{SecureRandom.hex}/#{filename_with_ext}"

#      bucket = ENV["AWS_BUCKET_ID"]

#      images = blitline_job(image, bucket, key)
#      self.image = images['results'][0]['images'][0]['s3_url'] # extracts s3_url from blitline's ruby hashes
#    end

    def blitline_job
      job_data = {
        "application_id" => "0gy-omTDaj-kfNJ4QHV_rQg",
        "src" => attachment1.url,
        'postback_url' => Rails.application.routes.url_helpers.blitline_callbacks_url(host: 'http://4921befa.ngrok.io'),
          "functions": [
              {
                  "name": "resize_to_fit",
                  "params": {
                      "width": 1500
                  },
                  "save": {
                      "image_identifier": "external_sample_1"
                  }
              }
          ]
      };

      http = Net::HTTP.new("api.blitline.com", 80)
      request = Net::HTTP::Post.new("http://api.blitline.com/job")
      request.set_form_data({"json" => JSON.dump(job_data)})
      http.request(request) do |response|
        if response.is_a?(Net::HTTPSuccess)
          output = response.read_body
        else
          output = "Error #{response.read_body}"
        end
        puts "result of blitline job"
        puts output
      end
    end

  end
end
