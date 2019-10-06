class ApplicationController < ActionController::Base
  before_action :current_user
  include SessionsHelper

  def current_user
    @curernt_user = User.find_by(id: session[:user_id])
  end

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
