class WWFinder::City
    attr_accessor :name, :url, :country
    attr_reader :buildings 

    @@all = []

    def initialize(name, url, country)
        @name = name 
        @url = url
        @buildings = []
        set_country(country)
        save
    end

    def get_buildings
        WWFinder::Scraper.scrape_buildings_for(self) if buildings.empty?
    end

    def self.all
        WWFinder::Scraper.scrape_cities if @@all.empty?
        @@all
    end

    def self.find(input)
        all[input]
    end

    private
    def save
        @@all << self 
    end
    
    def set_country(country)
        @country = country 
        country.cities << self
    end
end