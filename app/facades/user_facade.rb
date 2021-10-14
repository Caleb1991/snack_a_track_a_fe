class UserFacade
  def self.create_user_objects
    json = UserService.get_all_users

    json[:data][:attributes][:users].map do |user_attributes|
      User.new(user_attributes)
    end
  end
end
