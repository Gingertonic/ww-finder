class WWFinder::Scraper 
    def self.scrape_cities
        doc = Nokogiri::HTML(open("https://www.wework.com/en-GB/locations"))
        # binding.pry
        city_lis = doc.css("ul.markets-lists__list.markets-lists__list--GB li")
        city_lis.each do | city |
            name = city.css("a").text
            url = city.css("a").attr("href")
            WWFinder::City.new(name, url)
        end
    end 

    def self.scrape_buildings_for(city)
        doc = Nokogiri::HTML(open("https://www.wework.com#{city.url}"))
        building_cards = doc.css(".available-buildings-container .ray-card")
        building_cards.each do | building_card |
            name = building_card.css(".building-card__name").text
            location = building_card.css(".building-card__address").text
            url = building_card.attr("href")
            WWFinder::Building.new(name, location, url, city)
        end
    end

    def self.scrape_building_details(building)
        doc = Nokogiri::HTML(open("https://www.wework.com#{building.url}"))
        building.info = doc.css("div.building-info p.ray-text--body").text
    end

end