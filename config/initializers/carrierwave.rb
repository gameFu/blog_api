CarrierWave.configure do |config|
  # config.storage = :file
  # config.asset_host = ActionController::Base.asset_host
  config.storage = :qiniu
  Rails.application.secrets.qiniu.each_pair do |key, val|
    config.send "qiniu_#{key}=", val
  end
end

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end
