class WWFinder::CLI 
    attr_accessor :input, :selected_continent, :selected_country, :selected_city 

    def run 
        welcome
        app_loop
        start
    end

    def app_loop 
        while @input != "exit"
            print_countries_list
        end
    end

    def resize_screen
        print "\e[8;50;150t"
    end

    def welcome 
        puts "\nHai there! Are you looking for a place to work today?".light_white.on_magenta.bold
        puts "Hit enter to continue".green
        get_user_selection
    end

    def print_countries_list
        resize_screen
        table_data = []
        WWFinder::Continent.all.each.with_index(1) do | cont, i | 
            table_data << {"#{i.to_s.light_white.bold}. #{cont.name.light_white.on_magenta}": WWFinder::Continent.all.map{| cont | cont.countries[i - 1] ? "#{i.to_s.magenta}: #{cont.countries[i - 1].name}" : nil }}
        end  
        table = TTY::Table.new(table_data)
        puts table.render(:ascii)
        get_country_selection
    end

    def get_country_selection
        puts "Enter a continent number and country number eg '3, 2'".light_white.on_green
        get_user_selection
        cc_input = input.split(',')
        @input = cc_input[0]
        valid_input(WWFinder::Continent.all) ? set_continent : error("continent")
        @input = cc_input[1]
        valid_input(selected_continent.countries) ? set_country : error("country")
    end

    def set_continent
        @selected_continent = WWFinder::Continent.find(user_num_input)
    end

    def set_country
        @selected_country = selected_continent.find_country(user_num_input)
        print_cities_list
    end

    def print_cities_list
        selected_country.cities.each.with_index(1) do | city, idx |
            puts "#{idx}: #{city.name}"
        end
        get_city_selection
    end

    def get_city_selection
        instructions
        get_user_selection
        valid_input(selected_country.cities) ? set_city : error("city")
    end

    def set_city 
        @selected_city = selected_country.find_city(user_num_input)
        print_buildings_list
    end

    def print_buildings_list
        @selected_city.get_buildings
        @selected_city.buildings.each.with_index(1) do | building, idx |
            puts "#{idx}: #{building.address}"
        end
        get_building_selection
    end

    def instructions 
        puts "\nEnter the option number to see more details".green
    end

    def get_building_selection
        instructions
        get_user_selection
        valid_input(selected_city.buildings) ? show_building : error("building")
    end

    def show_building
        building = @selected_city.buildings[user_num_input]
        building.prepare_details
        puts "\n#{building.name}".light_white.on_magenta.bold
        puts building.info
        puts building.address.light_white.on_light_magenta
        what_next
    end

    def valid_input(data)
        user_num_input >= 0 && user_num_input <= data.length - 1
    end

    def error(entry_point)
        exit if input == "exit"
        puts "\nOops, that's not a valid #{entry_point} option".light_white.on_red.bold
        case entry_point 
        when "continent"
            get_country_selection
        when "country"
            get_country_selection
        when "city"
            get_city_selection 
        when "building"
            get_building_selection
        end
    end

    def what_next
        puts "\nIf you are done, type 'exit', otherwise type 'back' to see other buildings in this city, 'cities' to see other cities in this country, or hit enter to see more countries".green
        get_user_selection
    end 

    def get_user_selection
        @input = gets.strip
        case @input
        when "cities"
            print_cities_list
        when "back"
            print_buildings_list
        when "exit"
            goodbye
            exit
        end
    end

    def user_num_input
        input.to_i - 1 
    end

    def goodbye 
        puts "\nHappy working! Don't forget to take a break!\n".light_white.on_magenta.bold
        exit
    end
end