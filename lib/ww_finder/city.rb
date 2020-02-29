class WWFinder::City
    attr_accessor :name, :url
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

    def self.all
        stub_data if @@all.empty?
        @@all
    end

    def self.stub_data
        new("London", "/london")
        new("Manchester", "/manchester")
        new("Birmingham", "/birmingham")
    end
end