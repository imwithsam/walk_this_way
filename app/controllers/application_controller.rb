require "uri"
require "open-uri"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :coordinates, :address, :walk_score, :directions, :directions_url

  def coordinates
    { latitude: latitude, longitude: longitude }
  end

  def address
    params[:address] if params[:address] && !params[:address].empty?
  end

  def walk_score(address, latitude, longitude)
    Rails.cache.fetch("walk_score_#{address}_#{latitude}_#{longitude}",
                      expires_in: 15.minutes) do
      url = URI.parse("http://api.walkscore.com/score?format=json&address=#{address}&lat=#{latitude}&lon=#{longitude}&wsapikey=#{ENV['walk_score_api_key']}")
      JSON.parse(url.read, symbolize_names: true)
    end
  end

  def directions_url(origin, destination)
    "https://www.google.com/maps/embed/v1/directions?mode=walking&origin=#{origin}&destination=#{destination}&key=#{ENV['google_browser_api_key']}"
  end

  private

  def latitude
    # Default to Turing School latitude
    cookies[:latitude] ||= "39.749631099999995"
  end

  def longitude
    # Default to Turing School longitude
    cookies[:longitude] ||= "-105.0002013"
  end
end
