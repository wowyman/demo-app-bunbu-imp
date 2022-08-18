class HomeController < ApplicationController
  before_action :authenticate_account, only: [:auth]

  # Public method
  def index
    render json: { service: "auth-api", status: 200 }
  end

  # Authorized only method
  def auth
    render json: { status: 200, msg: "You are currently Logged-in as #{current_account.name}" }
  end
end
