class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :user_name
      devise_parameter_sanitizer.for(:account_update) << :user_name
    end

  private
    def check_questions_author
      redirect_to :back, alert: "You are not question's author!" if current_user != @question.user      
    end
end
