require "open-uri"

class SearchController < ApplicationController
  def index
    yelp_service = YelpService.new

    if address
      begin
        @businesses = yelp_service.search_by_address(address, term)
      rescue
        @businesses = yelp_service.search_by_coordinates(coordinates, term)
      end
    else
      @businesses = yelp_service.search_by_coordinates(coordinates, term)
    end
  end
end
