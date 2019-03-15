class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    vendors_path(user_id: current_user.id) # Or :prefix_to_your_route
  end
end