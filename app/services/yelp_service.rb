class YelpService
  def search_by_address(address, term = "")
    Rails.cache.fetch("yelp_search_#{address}_#{term}",
                      expires_in: 15.minutes) do
      response = Yelp.client.search(
        address,
        {
          term: term,
          limit:           10
        }
      )

      response.businesses.map do |business|
        YelpBusiness.new(business)
      end
    end
  end

  def search_by_coordinates(coordinates, term = "")
    Rails.cache.fetch("yelp_search_#{coordinates}_#{term}",
                      expires_in: 15.minutes) do
      response = Yelp.client.search_by_coordinates(
        coordinates,
        {
          term: term,
          limit:           10
        }
      )

      response.businesses.map do |business|
        YelpBusiness.new(business)
      end
    end
  end
end
