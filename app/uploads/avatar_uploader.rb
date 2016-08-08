class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  self.qiniu_bucket_private = false

  def filename
    "#{Time.current.to_i}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :big do
    process resize_to_fill: [300, 300]
  end

  version :medium do
    process resize_to_fill: [150, 150]
  end

  version :small do
    process resize_to_fill: [75, 75]
  end

  def default_url
    ApplicationSetting.defaults[:avatar]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def qiniu_async_ops
    commands = []
    %w(small medium big).each do |style|
      commands << "http://#{qiniu_bucket_domain}/#{store_dir}/#{filename}/#{style}"
    end
    commands
  end


end
