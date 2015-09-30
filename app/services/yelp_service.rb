class YelpService
  def search_by_address(address)
    Rails.cache.fetch("yelp_search_#{address}", expires_in: 15.minutes) do
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
  end

  def search_by_coordinates(coordinates)
    Rails.cache.fetch("yelp_search_#{coordinates}", expires_in: 15.minutes) do
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
end
