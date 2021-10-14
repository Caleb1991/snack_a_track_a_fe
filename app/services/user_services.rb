class UserServices
  def self.get_all_users
    response = conn.get('/api/v1/users')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_single_user(user_id)
    response = conn.get("/api/v1/users/#{user_id}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_users_snacks(user_id)
    response = conn.get("/api/v1/users/#{user_id}/snacks")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_users_top_rated_snacks(user_id, limit = 5)
    response = conn.get("/api/v1/users/#{user_id}/snacks/users_top_rated_snacks") do |req|
      req.params['limit'] = limit
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user_snack_recommendations(user_id)
    response = conn.get("/api/v1/users/#{user_id}/snacks/snack_recommendations")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://lit-reaches-91268.herokuapp.com/')
  end
end
