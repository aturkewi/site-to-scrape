class CssScraperServiceObject

  def get_data
    (1..1000).to_a.collect do |product_id|
      scrape(product_id)
    end
  end

  def get_page(product_id)
    raw_page = HTTParty.get("http://localhost:3000/products/#{product_id}")
    Nokogiri::HTML(raw_page)
  end

  def scrape(product_id)
    page = get_page(product_id)
    name = page.css('div.product-name h1').text
    sku = page.css('div.sku p').text.strip.delete("SKU: ")
    price = page.css('div.price h3').text.strip.delete("Price: ")
    {name:name, sku:sku, price:price}
  end

end
