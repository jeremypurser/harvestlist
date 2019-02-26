class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    before_action :vendors
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def vendors
        # @vendors = Product.pluck(:user_id).uniq
        @vendors = User.all
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :bio, :location, :avatar, :company])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :bio, :location,:avatar, :company])
    end
end
