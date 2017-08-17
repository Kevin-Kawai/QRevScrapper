class FilingScrapperJob < ApplicationJob
  queue_as :default

  def perform(filing)
    val = Scrapper.new.scrape
    val = val.split(' ')[1].delete(',').to_i
    filing.update_attributes(total_rev:val)
  end
end