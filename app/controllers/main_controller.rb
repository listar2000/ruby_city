require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    # Uncomment and pass a parameter to the get function
    @city = params[:city]
    if @city
      @w = WeatherService.get(@city)
      @k_temp = @w[:temperature]
      @c_temp = (@k_temp - 273).round(2)
      @desc = @w[:description]
      
      city = City.new(
        name: @city,
        description: @desc,
        temperature: @c_temp
      )
      
      city.save
    end
  end
end
