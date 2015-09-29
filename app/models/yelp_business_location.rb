class YelpBusinessLocation
  LOCATION_METHODS = [:address,
                      :city,
                      :state_code,
                      :postal_code,
                      :neighborhoods]

  def initialize(location)
    @location = location
  end

  LOCATION_METHODS.each do |name|
    define_method(name) { try_to_delegate_to_burst_struct(name) }
  end

  def coordinate
    YelpLocationCoordinate.new(@location.coordinate)
  end

  def full_address
    address.join(", ") if address
  end

  def neighborhoods_html
    neighborhoods.join(", ").join("<br>").html_safe if neighborhoods
  end

  def try_to_delegate_to_burst_struct(name)
    if @location.respond_to?(name)
      @location.send(name)
    else
      nil
    end
  end
end
