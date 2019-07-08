class FundsController < ApplicationController
  before_action :load_fund, except: %i(new create index)
  before_action :authenticate_user!

  def index
    @pagy, @funds = pagy Fund.list, items: Settings.controller.funds_controller.page
  end

  def show; end

  def new
    @fund = Fund.new
  end

  def create
    @fund = Fund.new fund_params.merge user_id: current_user.id
    if @fund.save
      flash[:success] = t(".created")
      redirect_to funds_path
    else
      flash[:error] = t(".create_unsuccess")
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
