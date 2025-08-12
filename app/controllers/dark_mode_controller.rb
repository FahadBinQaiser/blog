class DarkModeController < ApplicationController
  def create
    if user_signed_in?
      current_user.update(dark_mode: !current_user.dark_mode)
    else
      if cookies[:dark_mode] == "true"
        cookies[:dark_mode] = "false"
      else
        cookies[:dark_mode] = "true"
      end
    end

    redirect_back(fallback_location: root_path)
  end
end
