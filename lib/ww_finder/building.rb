class WWFinder::Building 
    attr_accessor :name, :address, :url

    @@all = []

    def initialize(name, address, url)
        @name = name 
        @address = address 
        @url = url
    end

    def self.all 
        @@all 
    end

    private 
    def save 
        @@all << self 
    end 
 
end