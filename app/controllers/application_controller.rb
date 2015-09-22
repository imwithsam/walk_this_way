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
    if cookies[:latitude]
      cookies[:latitude];
    else
      "39.749631099999995";
    end
  end

  def longitude
    if cookies[:longitude]
      cookies[:longitude];
    else
      "-105.0002013";
    end
  end
end
