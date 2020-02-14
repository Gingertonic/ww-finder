class WWFinder::CLI 
    attr_accessor :input

    def run 
        welcome
        app_loop
        goodbye
    end

    def welcome 
        puts "Hai! Hit enter to continue"
    end


    def instructions 
        puts "Enter the option number to see more details"
    end

    def app_loop 
        while input != "exit" do
            @input = gets.strip
            instructions
            show_buildings
        end
    end

    def show_buildings
        puts "Here lie buildings"
        binding.pry
    end

    def goodbye 
        puts "Happy working! Don't forget to take a break!"
    end
end