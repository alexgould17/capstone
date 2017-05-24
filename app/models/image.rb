class Image < ApplicationRecord
  belongs_to :user

  before_save do
    self.latitude = self.latitude.to_f unless self.latitude.class == 'Float'
    self.longitude = self.longitude.to_f unless self.longitude.class == 'Float'

    # Make sure latitude is between -90 & 90 degrees
    if self.latitude < -90
      self.latitude = -90
    elsif self.latitude > 90
      self.latitude = 90
    end

    # Make sure longitude is between -180 & 180 degrees
    if self.longitude < -180
      self.longitude = -180
    elsif self.longitude > 180
      self.longitude = 180
    end

    if self.pictype == :picture
      self.pictype = 0
    elsif self.pictype == :artwork
      self.pictype = 1
    elsif self.pictype == :other
      self.pictype = 2
    else
      self.pictype = 0
    end

    # Make sure width & height are integers
    self.width = self.width.to_i unless self.width.class == 'Integer'
    self.height = self.height.to_i unless self.height.class == 'Integer'

    self.aspect_ratio = width.to_f / height.to_f

    # Filter unwanted characters from the tags
    self.tags.gsub!(/[^0-9a-zA-Z\-_\+=~\.\?\$;:'"@#\$%\^\&\*\(\)\[\]\{\}\\\/<>,]/,'')
  end

  enum pictype: [:picture, :artwork, :other]
end
