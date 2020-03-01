class WWFinder::Country
    attr_accessor :name, :continent
    attr_reader :cities 

    @@all = []

    def initialize(name, continent)
        @name = name 
        @cities = []
        set_continent(continent)
        save
    end

    def self.all
        WWFinder::Scraper.scrape_countries if @@all.empty?
        @@all
    end

    def self.find(input)
        all[input]
    end

    def find_city(input)
        cities[input]
    end

    private
    def save
        @@all << self 
    end

    def set_continent(cont)
        @continent = cont 
        continent.countries << self
    end
    
end