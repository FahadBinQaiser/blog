class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    root_path  # 👈 redirects to homepage after login
  end
   def dark_mode?
    if user_signed_in?
      current_user.dark_mode?
    else
      cookies[:dark_mode] == "true"
    end
   end

  helper_method :dark_mode?
end
