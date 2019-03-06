CarrierWave.configure do |config|
 config.fog_credentials = {
   :provider => "AWS",
   :aws_access_key_id => "#{ENV["AWS_ACCESS_KEY_ID"]}",
   :aws_secret_access_key => "#{ENV["AWS_SECRET_ACCESS_KEY"]}",
   :region => "#{ENV["S3_REGION"]}",
   :path_style => true,
   :host => "s3-#{ENV["S3_REGION"]}.amazonaws.com",
   :endpoint => "https://s3-#{ENV["S3_REGION"]}.amazonaws.com",
 }

 config.fog_directory = "#{ENV["S3_BUCKET_NAME"]}"
 config.cache_dir = "#{Rails.root}/tmp/uploads"
 # config.asset_host = "https://s3-#{ENV["S3_REGION"]}.amazonaws.com"
end

