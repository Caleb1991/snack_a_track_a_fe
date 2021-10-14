class User
  attr_reader :id,
              :first_name,
              :last_name,
              :username,
              :email

  def initialize(user_attributes)
    @id = user_attributes[:id]
    @first_name = user_attributes[:first_name]
    @last_name = user_attributes[:last_name]
    @username = user_attributes[:username]
    @email = user_attributes[:email]
  end
end
