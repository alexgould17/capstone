class Image < ApplicationRecord
  belongs_to :user

  before_save do
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

    # TODO: Add aspect ratio calculations
  end

  enum pictype: [:picture, :artwork, :other]
end