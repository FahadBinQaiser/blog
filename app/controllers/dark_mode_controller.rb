class DarkModeController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.update(dark_mode: !current_user.dark_mode)
    redirect_to root_path
  end
end
