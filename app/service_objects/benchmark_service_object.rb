class BenchmarkServiceObject


  def self.run_benchmark
    iterations = 1
    Benchmark.bmbm do |bm|
      benchmark_css(bm, iterations)
      benchmark_xpath(bm, iterations)
    end
  end

  def self.benchmark_css(bm, iterations)
    bm.report('scraping with css selectors') do
      iterations.times {CssScraperServiceObject.new.get_data}
    end
  end

  def self.benchmark_xpath(bm, iterations)
    bm.report('scraping with xpath selectors') do
      iterations.times {XpathScraperServiceObject.new.get_data}
    end
  end

  def self.check_nokogiri_import
    range = (1..1000).to_a
    Benchmark.bmbm do |bm|
      benchmark_html_import(bm, range)
      benchmark_xml_import(bm, range)
    end
  end

  def self.benchmark_html_import(bm, range)
    bm.report('get nokogiri in html format') do
      range.each {|num| CssScraperServiceObject.new.get_page(num)}
    end
  end

  def self.benchmark_xml_import(bm, range)
    bm.report('get nokogiri in xml format') do
      range.each {|num| XpathScraperServiceObject.new.get_page(num)}
    end
  end

end
