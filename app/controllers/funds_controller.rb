class FundsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_fund, except: %i(new create index add_user)

  def index
    @pagy, @funds = pagy Fund.list, items: Settings.controller.funds_controller.page
  end

  def show; end

  def new
    @fund = Fund.new
    @user = current_user.decorate
    @key = SecureRandom.random_number Settings.random_key
  end

  def create
    @fund = Fund.new fund_params
    if @fund.save
      flash[:success] = t(".created")
      redirect_to funds_path
    else
      flash[:error] = t(".create_unsuccess")
      @user = current_user.decorate
      @key = SecureRandom.random_number Settings.random_key
      render :new
    end
  end

  def edit; end

  def update
    if @fund.update fund_params
      flash[:success] = t(".fund_updated")
      redirect_to funds_path
    else
      render :edit
    end
  end

  def add_user
    unless @user = User.find_by(email: params[:email])
      @user = User.new email: params[:email]
    end
    @history = History.new money: params[:money]
    @key = SecureRandom.random_number Settings.random_key
    respond_to do |format|
      format.js
    end
  end

  private
  def fund_params
    params.require(:fund).permit Fund::FUND_PARAMS
  end

  def load_fund
    return if @fund = Fund.find_by(id: params[:id])
    flash[:error] = t(".you_not_permited")
    redirect_to root_path
  end
end
