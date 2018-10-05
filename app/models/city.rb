class City
    attr_accessor :name, :landmark, :population, :weather
    $cities = {}

	def initialize(city_params)
		@name = city_params[:name]
		@landmark = city_params[:landmark]
        @population = city_params[:population]
    end
    
    def save
        $cities[@name.to_sym] = self
    end

    def update(update_params)
        update_params.each_key do |k|
            if k.to_s == 'landmark'
                @landmark = update_params[k]    
            elsif k.to_s == 'population'
                @population = update_params[k]
            end
        end
    end

    def self.all
        $cities
    end

    def self.delete(city_name)
        $cities.delete(city_name.to_sym)
    end
end