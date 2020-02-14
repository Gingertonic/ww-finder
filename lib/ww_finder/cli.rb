class WWFinder::CLI 
    attr_accessor :input

    def run 
        welcome
        app_loop
        goodbye
    end

    def welcome 
        puts "Hai! Hit enter to continue"
        gets
    end


    def instructions 
        puts "\nEnter the option number to see more details"
    end

    def app_loop 
        while input != "exit" do
            show_buildings
        end
    end

    def show_buildings
        WWFinder::Building.all.each.with_index(1) do | building, idx |
            puts "#{idx}: #{building.address}"
        end
        get_user_selection
        show_building if valid_input(WWFinder::Building.all)
    end

    def show_building
        building = WWFinder::Building.all[user_num_input]
        building.prepare_details
        puts "\n#{building.name}".colorize(:magenta)
        puts building.info
        puts building.address.colorize(:light_magenta)
        what_next
    end

    def valid_input(data)
        user_num_input > 0 && user_num_input <= data.length
    end

    def error 
        puts "Oops, that's not a valid option"
    end

    def what_next
        puts "\nIf you are done, type 'exit', otherwise hit enter to continue\n"
        get_user_selection
    end 

    def get_user_selection
        @input = gets.strip
    end

    def user_num_input
        input.to_i - 1
    end

    def goodbye 
        puts "Happy working! Don't forget to take a break!"
    end
end