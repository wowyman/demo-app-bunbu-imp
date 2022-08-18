class AccountsController < ApplicationController
  # protect_from_forgery with: :null_session

  before_action :authenticate_account, only: [:index, :current, :update]
  before_action :authorize_as_account, only: [:destroy]
  before_action :authorize, only: [:update]

  # Should work if the current_user is authenticated.
  def index
    render json: { status: 200, msg: "Logged-in" }
  end

  # Call this method to check if the user is logged-in.
  # If the user is logged-in we will return the user's information.
  def current
    current_account.update!(last_login: Time.now)
    render json: current_account
  end

  def create
    account = Account.new(account_params)
    if account.save
      render json: { status: 200, msg: "Account was created." }
    end
  end

  def update
    account = Account.find(params[:id])
    if account.update(account_params)
      render json: { status: 200, msg: "account details have been updated." }
    end
  end

  def destroy
    account = Account.find(params[:id])
    if account.destroy
      render json: { status: 200, msg: "account has been deleted." }
    end
  end

  private

  # Setting up strict parameters for when we add account creation.
  def account_params
    params..require(:account).permit(:name, :email, :password, :password_confirmation)
  end

  # Adding a method to check if current_user can update itself.
  # This uses our UserModel method.
  def authorize
    return_unauthorized unless current_account && current_account.can_modify_account?(params[:id])
  end
end
