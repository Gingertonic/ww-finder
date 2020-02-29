class WWFinder::Country
    attr_accessor :name
    attr_reader :cities 

    @@all = []

    def initialize(name, url)
        @name = name 
        @cities = []
        save
    end

    def self.all
        WWFinder::Scraper.scrape_countries if @@all.empty?
        @@all
    end

    def self.find(input)
        all[input]
    end

    private
    def save
        @@all << self 
    end
    
end