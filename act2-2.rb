require 'httparty'

def cryptocurrency_price_tracker
  url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
  response = HTTParty.get(url)
  cryptocurrencies = JSON.parse(response.body)
  
  top_5_cryptocurrencies = cryptocurrencies.sort_by { |crypto| -crypto['market_cap'] }.take(5)
  
  puts "Top 5 Cryptocurrencies by Market Capitalization:"
  top_5_cryptocurrencies.each do |crypto|
    puts "Name: #{crypto['name']}"
    puts "Price (USD): #{crypto['current_price']}"
    puts "Market Cap (USD): #{crypto['market_cap']}"
    puts "-----------------------------------"
  end
end

# Example usage:
cryptocurrency_price_tracker