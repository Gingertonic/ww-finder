class WWFinder::Building 
    attr_accessor :name, :address, :url, :id

    @@all = []

    def initialize(name, address, url)
        @name = name 
        @address = address 
        @url = url
        set_id
        save
    end

    def set_id 
        @id = @@all.count + 1
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