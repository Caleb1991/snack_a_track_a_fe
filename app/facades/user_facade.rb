class UserFacade
  def self.create_user_objects
    json = UserService.get_all_users

    json[:data][:attributes][:users].map do |user_attributes|
      User.new(user_attributes)
    end
  end

  def self.create_single_user_object(user_id)
    user_attributes = UserService.get_single_user(user_id)

    User.new(user_attributes[:data][:attributes])
  end

  def self.log_in_user(user_parameters)
    user_login = UserService.log_user_in(user_parameters)
    success_message = "You have successfully logged in!"

    if user_login[:data][:attributes][:message] == success_message
      {logged_in: true, id: user_login[:data][:id]}
    else
      {logged_in: false}
    end
  end

  def self.register_user(user_parameters)
    user = UserService.create_user(user_parameters)

    if user[:data][:id] != nil
      User.new(user[:data][:attributes])
    else
      user[:data][:attributes][:errors]
    end
  end
end
