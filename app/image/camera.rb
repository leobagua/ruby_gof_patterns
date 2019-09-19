module Image
  class Camera
    require 'base64'

    def self.take_photo
      File.open(File.expand_path('../../assets/photo.jpg', File.dirname(__FILE__))) do |photo|
        'data:image/jpg;base64,' + Base64.strict_encode64(photo.read)
      end
    end
  end
end