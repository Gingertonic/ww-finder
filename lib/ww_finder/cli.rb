class WWFinder::CLI 
    attr_accessor :input, :selected_city 

    def run 
        welcome
        app_loop
        start
    end

    def app_loop 
        while @input != "exit"
            print_cities_list
        end
    end

    def welcome 
        puts "\nHai there! Are you looking for a place to work in the UK today?".light_white.on_magenta.bold
        puts "Hit enter to continue".green
        get_user_selection
    end

    def print_cities_list
        WWFinder::City.all.each.with_index(1) do | city, idx |
            puts "#{idx}: #{city.name}"
        end
        get_city_selection
    end

    def get_city_selection
        instructions
        get_user_selection
        valid_input(WWFinder::City.all) ? set_city : error
    end

    def set_city 
        @selected_city = WWFinder::City.find(user_num_input)
        print_buildings_list
    end

    def print_buildings_list
        WWFinder::Building.all.each.with_index(1) do | building, idx |
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
        valid_input(WWFinder::Building.all) ? show_building : error
    end

    def show_building
        building = WWFinder::Building.all[user_num_input]
        building.prepare_details
        puts "\n#{building.name}".light_white.on_magenta.bold
        puts building.info
        puts building.address.light_white.on_light_magenta
        what_next
    end

    def valid_input(data)
        user_num_input >= 0 && user_num_input <= data.length - 1
    end

    def error 
        puts "\nOops, that's not a valid option".light_white.on_red.bold
        selected_city ? get_building_selection : get_city_selection
    end

    def what_next
        puts "\nIf you are done, type 'exit', otherwise type 'back' to see other buildings in this city, or hit enter to see more cities".green
        get_user_selection
    end 

    def get_user_selection
        @input = gets.strip
        case @input
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