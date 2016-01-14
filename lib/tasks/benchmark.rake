namespace :benchmark do
  desc "TODO"
  task run_benchmark: :environment do
    BenchmarkServiceObject.run_benchmark
  end

  desc "TODO"
  task check_nokogiri_import: :environment do
    BenchmarkServiceObject.check_nokogiri_import
  end

end
