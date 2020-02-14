class WWFinder::Building 
    attr_accessor :name, :address, :url

    @@all = []

    def initialize(name, address, url)
        @name = name 
        @address = address 
        @url = url
        save
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