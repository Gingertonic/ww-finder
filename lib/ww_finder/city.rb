class WWFinder::City
    attr_accessor :name, :url
    attr_reader :buildings 

    @@all = []

    def initialize(name, url)
        @name = name 
        @url = url
        @buildings = []
        save
    end

    def save
        @@all << self 
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

    def self.stub_data
        new("London", "/london")
        new("Manchester", "/manchester")
        new("Birmingham", "/birmingham")
    end
end