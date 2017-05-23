module ImagesHelper
  # Given a collection's user & the current user, produces an appropriate title for the collection.
  def collection_title(user, current_user)
    (current_user == user ? "Your" : (user.name << "'s")) << " Collection"
  end

  # Gives a CSS class name based on the pictype
  def image_class(image)
    case image.pictype
    when :picture
      return "collectionImagePicture"
    when :artwork
      return "collectionImageArtwork"
    when :other
      return "collectionImageDefault"
    end
  end

  # Returns a size to pass to the image_tag function
  def image_small_size(aspect_ratio)
    max_width = 300
    max_height = 300
    size = ""
    if aspect_ratio < max_width/max_height
      # If the image in question is narrower than our defined box (smaller aspect ratio),
      # then use maximum height & scale the width to fit by multiplying the max width
      # by the aspect ratio.
      width = (max_width * aspect_ratio).floor
      size = "#{width}x#{max_height}"
    else
      # Otherwise, the image in question is wider than our defined box (larger aspect ratio),
      # so use maximum width & scale the height to fit by dividing the max height
      # by the aspect ratio.
      height = (max_height / aspect_ratio).floor
      size = "#{max_width}x#{height}"
    end
    size
  end

  def image_large_size(aspect_ratio)
    max_width = 800
    max_height = 800
    size = ""
    if aspect_ratio < max_width/max_height
      # If the image in question is narrower than our defined box (smaller aspect ratio),
      # then use maximum height & scale the width to fit by multiplying the max width
      # by the aspect ratio.
      width = (max_width * aspect_ratio).floor
      size = "#{width}x#{max_height}"
    else
      # Otherwise, the image in question is wider than our defined box (larger aspect ratio),
      # so use maximum width & scale the height to fit by dividing the max height
      # by the aspect ratio.
      height = (max_height / aspect_ratio).floor
      size = "#{max_width}x#{height}"
    end
    size
  end

  # Returns a string with the given latitude & longitude translated into degrees, minutes, seconds
  # notation. Rounds to the nearest arcsecond (accurate to within ~5 meters).
  def location_with_symbols(latitude, longitude)
    lat_dir = ""
    long_dir = ""
    if latitude < 0
      lat_dir = "S"
      latitude = latitude.abs
    else
      lat_dir = "N"
    end
    if longitude < 0
      long_dir = "W"
      longitude = longitude.abs
    else
      long_dir = "E"
    end
    latitude_string = "#{latitude.floor}° "
    longitude_string = "#{longitude.floor}° "
    lat_min = (latitude - latitude.floor) * 60
    long_min = (longitude - longitude.floor) * 60
    latitude_string << "#{lat_min.floor}′ "
    longitude_string << "#{long_min.floor}′ "
    lat_sec = ((lat_min - lat_min.floor) * 60).round
    long_sec = ((long_min - long_min.floor) * 60).round
    latitude_string << "#{lat_sec.floor}″ " << lat_dir
    longitude_string << "#{long_sec.floor}″ " << long_dir
    latitude_string + ", " + longitude_string
  end
end
