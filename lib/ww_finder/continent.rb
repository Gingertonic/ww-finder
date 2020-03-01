class WWFinder::Continent
    attr_accessor :name
    attr_reader :countries 

    @@all = []

    def initialize(name)
        @name = name 
        @countries = []
        save
    end

    def self.all
        WWFinder::Scraper.scrape_continents_and_countries if @@all.empty?
        @@all
    end

    private
    def save
        @@all << self 
    end
    
end