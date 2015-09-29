require "open-uri"

class SearchController < ApplicationController
  def index
    yelp_service = YelpService.new

    if address
      begin
        @businesses = yelp_service.search_by_address(address)
      rescue
        @businesses = yelp_service.search_by_coordinates(coordinates)
      end
    else
      @businesses = yelp_service.search_by_coordinates(coordinates)
    end
  end
end
