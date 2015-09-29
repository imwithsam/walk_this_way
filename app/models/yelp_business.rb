class YelpBusiness
  BUSINESS_METHODS = [:image_url,
                      :name,
                      :location,
                      :distance]

  def initialize(burst_struct)
    @burst_struct = burst_struct
  end

  BUSINESS_METHODS.each do |name|
    define_method(name) { try_to_delegate_to_burst_struct(name) }
  end

  def location
    YelpBusinessLocation.new(@burst_struct.location)
  end

  def try_to_delegate_to_burst_struct(name)
    if @burst_struct.respond_to?(name)
      @burst_struct.send(name)
    else
      nil
    end
  end
end
