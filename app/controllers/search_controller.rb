class SearchController < ApplicationController
  def index
    if params[:address]
      location = params[:address]
      @response = Yelp.client.search(
        location,
        {
          sort: 1,
          radius_filter: 8047,
          limit: 10
        })
    else
      @response = Yelp.client.search_by_coordinates(
        coordinates,
        {
          sort: 1,
          radius_filter: 8047,
          limit: 10
        })
    end
  end
end
