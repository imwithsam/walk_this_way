class GeolocationController < ApplicationController
  def create
    cookies[:latitude] = params[:latitude];
    cookies[:longitude] = params[:longitude];

    render nothing: true
  end
end
