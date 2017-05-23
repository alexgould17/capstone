class Image < ApplicationRecord
  belongs_to :user

  before_save do
    flash[:notice] = []
    # Make sure latitude is between -90 & 90 degrees
    if self.latitude < -90
      self.latitude = -90
      flash[:notice] << "Latitude can't be less than -90!"
    elsif self.latitude > 90
      self.latitude = 90
      flash[:notice] << "Latitude can't be greater than 90!"
    end

    # Make sure longitude is between -180 & 180 degrees
    if self.longitude < -180
      self.longitude = -180
      flash[:notice] << "Longitude can't be less than -180!"
    elsif self.longitude > 180
      self.longitude = 180
      flash[:notice] << "Longitude can't be greater than 180!"
    end

    # Set pictype to :picture if it is undefined, out of range, wrong type, etc.
    if self.pictype != :picture && self.pictype != :artwork && self.pictype != :other
      self.pictype = :picture
    end

    # Make sure width & height are integers
    self.width = self.width.to_i unless self.width.class == 'Integer'
    self.height = self.height.to_i unless self.height.class == 'Integer'

    self.aspect_ratio = width.to_f / height.to_f

    # Filter unwanted characters from the tags
    badchars = self.tags.gsub!(/[^0-9a-zA-Z\-_\+=~\.\?\$;:'"@#\$%\^\&\*\(\)\[\]\{\}\\\/<>]/,'')
    flash[:notice] << "Unsupported characters detected in tags!" if badchars
  end

  enum pictype: [:picture, :artwork, :other]
end
