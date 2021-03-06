class WWFinder::Scraper 
    def self.scrape_continents_and_countries
        doc = Nokogiri::HTML(open("https://www.wework.com/en-GB/locations"))
        continent_divs = doc.css("div.markets-list__continent")
        continent_divs.each do | cont_div |
            name = cont_div.css(".continent__label h2").text
            continent = WWFinder::Continent.new(name)
            extract_countries(continent, cont_div) 
        end
    end 

    def self.extract_countries(continent, cont_data)
        country_divs = cont_data.css("div.markets-list__country")
        country_divs.each do | country_div |
            name = country_div.css("h3").text
            country = WWFinder::Country.new(name, continent)
            extract_cities(country, country_div)
        end
    end 

    def self.extract_cities(country, country_data)
        city_lis = country_data.css("ul.markets-lists__list li")
        city_lis.each do | city |
            name = city.css("a").text
            url = city.css("a").attr("href")
            WWFinder::City.new(name, url, country)
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