class YelpService
  def search_by_address(address)
    response = Yelp.client.search(
      address,
      {
        limit: 10
      }
    )

    response.businesses.map do |business|
      YelpBusiness.new(business)
    end
  end

  def search_by_coordinates(coordinates)
    response = Yelp.client.search_by_coordinates(
      coordinates,
      {
        limit: 10
      }
    )

    response.businesses.map do |business|
      YelpBusiness.new(business)
    end
  end
end
