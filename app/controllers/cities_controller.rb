require_relative "../services/weather_service"

class CitiesController < ApplicationController
    
    $authenticicy_token = "psCykm1oDcL7lJoUPXuO1vspCjH6jkGYN/FGuisn5CC9ydOmg++J38cOi4wAYCKGtdvOSsvyHQ0lsnjVXiLR7g=="

    def view
        @city = params[:city]
        @token = $authenticicy_token
        if @city
            @has_found = City.all.key?(@city.to_sym)
        end
    end

    def new
    end

    def create
        # make sure that city itself cannot be null, otherwise return new.html.erb
        if not @city.nil?
            redirect_to "/cities/new"
            return
        end
        @city = params[:city]
        if @city && City.all.key?(@city.to_sym) == false
            city = City.new(
                name: @city,
                landmark: params[:landmark],
                population: params[:population]
            )
            city.save
        end
        redirect_to "/cities/view"
    end

    def update
        if not params[:city].nil?
            @city = City.all[params[:city].to_sym]
        end
    end

    def update_post
        @city = City.all[params[:city].to_sym]
        if params[:landmark].nil? || params[:landmark] == ''
            params[:landmark] = No_Where
        end
        if params[:population].nil? || params[:population] == ''
            params[:population] = 0
        end
        @city.update(landmark: params[:landmark], population: params[:population])
        redirect_to "/cities/view"
    end

    def delete
        if not params[:city].nil?
            City.delete(params[:city])
        end
        redirect_to "/cities/view"
    end
end