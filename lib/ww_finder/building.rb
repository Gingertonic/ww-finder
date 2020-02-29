class WWFinder::Building 
    attr_reader :name, :address, :url, :id
    attr_accessor :info

    @@all = []

    def initialize(name, address, url, city)
        @name = name 
        @address = address 
        @url = url
        set_city(city)
        set_id
        save
    end

    def set_city(city)
        @city = city 
        city.buildings << self
    end

    def set_id 
        @id = @@all.count + 1
    end 

    def prepare_details
        WWFinder::Scraper.scrape_building_details(self) if !info
    end

    def self.all 
        WWFinder::Scraper.scrape_buildings if @@all.empty?
        @@all 
    end

    private 
    def save 
        @@all << self 
    end 
 
end