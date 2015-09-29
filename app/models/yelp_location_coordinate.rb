class YelpLocationCoordinate
  COORDINATE_METHODS = [:latitude,
                      :longitude]

  def initialize(coordinate)
    @coordinate = coordinate
  end

  COORDINATE_METHODS.each do |name|
    define_method(name) { try_to_delegate_to_burst_struct(name) }
  end

  def try_to_delegate_to_burst_struct(name)
    if @coordinate.respond_to?(name)
      @coordinate.send(name)
    else
      nil
    end
  end
end
