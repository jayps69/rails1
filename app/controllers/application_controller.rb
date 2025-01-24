class ApplicationController < ActionController::Base
    # Global error handling for CanCan::AccessDenied
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_path, alert: "You don't have permission to access this page."
    end
  end
  