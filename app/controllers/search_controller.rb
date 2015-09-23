require "open-uri"

class SearchController < ApplicationController
  def index
    if address
      begin
        @response = search_by_address(address)
      rescue
        @response = search_by_coordinates(coordinates)
      end
    else
      @response = search_by_coordinates(coordinates)
    end
  end

  private

  def search_by_address(address)
    Yelp.client.search(
      address,
      {
        limit: 10
      }
    )
  end

  def search_by_coordinates(coordinates)
    Yelp.client.search_by_coordinates(
      coordinates,
      {
        limit: 10
      }
    )
  end
end
