class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    before_action :vendors
    before_action :categories
    before_action :emojis

    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    EMOJIS = { "Flowers" => "🌼",
        "Herbs" => "🌱",
        "Produce" => "🥕",
        "Dairy" => "🧀",
        "Eggs" => "🍳",
        "Meat & Poultry" => "🥩",
        "Seafood" => "🍤",
        "Other" => "🔮" }

    def emojis
        @emojis = EMOJIS
    end

    def vendors
        @vendors = User.all
    end

    def categories
        @categories = Category.all 
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :bio, :location, :avatar, :company, :role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :bio, :location,:avatar, :company, :role])
    end
end
