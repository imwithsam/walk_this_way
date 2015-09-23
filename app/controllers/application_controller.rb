class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :coordinates

  def coordinates
    { latitude: latitude, longitude: longitude }
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
