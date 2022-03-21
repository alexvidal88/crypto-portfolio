class Currency < ApplicationRecord

  def calculate_value(amount)
    (current_price.to_f * amount.to_f).round(4)
  end

  def current_price
    url = 'https://api.coincap.io/v2/assets/'
    request = HTTParty.get(url + self.slug)
    response = JSON.parse(request.body)["data"]["priceUsd"]
  end

end
