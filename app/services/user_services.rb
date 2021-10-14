class UserServices
  def self.get_all_users
    response = conn.get('/api/v1/users')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://lit-reaches-91268.herokuapp.com/')
  end
end
