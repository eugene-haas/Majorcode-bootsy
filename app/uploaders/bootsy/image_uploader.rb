module Bootsy
  class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    storage Bootsy.storage

    def store_dir
      "#{Bootsy.store_dir}/#{model.class.to_s.underscore}/#{model.id}"
    end

    process resize_to_limit: [960, 5000]

=begin
    version :large do
      process resize_to_fit: [480, 2500]
    end

    version :large do
      process resize_to_fit: [
        Bootsy.large_image[:width], Bootsy.large_image[:height]
      ]
    end
    version :medium do
      process resize_to_fit: [
        Bootsy.medium_image[:width], Bootsy.medium_image[:height]
      ]
    end
    version :small do
      process resize_to_fit: [
        Bootsy.small_image[:width], Bootsy.small_image[:height]
      ]
    end
=end
    version :thumb do
      process resize_to_fill: [60, 60]
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end
  end
end
