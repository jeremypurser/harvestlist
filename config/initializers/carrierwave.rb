CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'Google',
    google_storage_access_key_id: ENV['google_storage_access_key_id'],
    google_storage_secret_access_key: ENV['google_storage_secret_access_key']
  }
  config.fog_directory = 'jpurser-harvestlist'
end