class SnackService
  def self.get_all_snacks
    response = conn.get('/api/v1/snacks')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_single_snack(snack_id)
    response = conn.get("/api/v1/snacks/#{snack_id}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_all_savory_or_sweet_snacks(taste, limit = 5)
    response = conn.get('/api/v1/snacks/get_all_savory_or_sweet_snacks') do |req|
      req.params['taste'] = taste
      req.params['limit'] = limit
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://lit-reaches-91268.herokuapp.com/')
  end
end
