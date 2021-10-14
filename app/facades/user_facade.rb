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
end
