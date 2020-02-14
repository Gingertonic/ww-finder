class WWFinder::Scraper 

    def self.scrape_buildings
        doc = Nokogiri::HTML(open("https://www.wework.com/en-GB/l/london"))
        building_cards = doc.css(".available-buildings-container .ray-card")
        building_cards.each do | building_card |
            name = building_card.css(".building-card__name").text
            location = building_card.css(".building-card__address").text
            url = building_card.attr("href")
            WWFinder::Building.new(name, location, url)
        end
    end

end