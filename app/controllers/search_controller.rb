class SearchController < ApplicationController
  def index
    @response = Yelp.client.search_by_coordinates(coordinates, {
      term: "coffee",
      sort: 1,
      radius_filter: 8047,
      limit: 10
    })
  end
end
