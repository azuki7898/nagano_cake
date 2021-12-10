class ApplicationController < ActionController::Base
  def after_admin_sign_in_path_for(resource)
    admin_path
  end
end
