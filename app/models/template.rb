class Template < ActiveRecord::Base
  require 'blitline'

  has_attached_file :attachment1, url: "/esignhealth/images/:id/:filename", path:"/esignhealth/images/:id/:filename"

  validates_attachment_content_type :attachment1, path: '/templates', url: '/templates',content_type: [/image/, 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']

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



    def blitline_job

	job_data = {
		    "application_id": "0gy-omTDaj-kfNJ4QHV_rQg",
			"src" => attachment1.url,
		    #{}"src_type" => "smart_image",
		    "wait_retry_delay" => 10,
		    "retry_postback" => true,
		    #{}"src_type" => "burst_pdf",
		    "postback_url" => 'http://646aa1ca.ngrok.io/blitline_callbacks',
		    "v" => 1.22,
		    "functions": [
		        {
		            "name": "resize_to_fit",
		            "params": {
		                "width": 1500,
		            },
		            "save": {
		                "image_identifier": "external_sample_1",
		                "png_quant": true,
		                "extension": "png",
		                "s3_destination"   => { "key" => "esignhealth/images/#{id}/upload.png", "bucket" => ENV["AWS_BUCKET_ID"] } # push to your S3 bucket

		            }
		        }
		    ]
		}


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
