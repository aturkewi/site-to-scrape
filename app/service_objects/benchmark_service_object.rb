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

end
