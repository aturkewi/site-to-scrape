class XpathScraperServiceObject

    def get_data
      (1..1000).to_a.collect do |product_id|
        scrape(product_id)
      end
    end

    def get_page(product_id)
      raw_page = HTTParty.get("http://localhost:3000/products/#{product_id}")
      Nokogiri::XML(raw_page)
    end

    def scrape(product_id)
      page = get_page(product_id)
      name = page.xpath("//div[@class='product-name']/h1").text
      sku = page.xpath("//div[@class='sku']/p").text.strip.delete("SKU: ")
      price = page.xpath("//div[@class='price']/h3").text.strip.delete("Price: ")
      {name:name, sku:sku, price:price}
    end

end
