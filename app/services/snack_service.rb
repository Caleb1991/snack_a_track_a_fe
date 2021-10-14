class SnackService
  def self.get_all_snacks
    response = conn.get('/api/v1/snacks')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://lit-reaches-91268.herokuapp.com/')
  end
end
