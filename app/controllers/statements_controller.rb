class StatementsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user_fund
  before_action :load_statement, except: %i(index new create)

  def index
    @pagy_statement, @statements = pagy Statement.list, items: Settings.controller.statements_controller.page
    @statements = StatementDecorator.decorate_collection @statements
  end

  def show; end

  def new
    @statement = @user_fund.statements.new
  end

  def create
    @statement = @user_fund.statements.new statement_params
    if @statement.save
      flash[:success] = t(".created")
      redirect_to fund_statements_path
    else
      flash[:error] = t(".create_unsuccess")
      render :new
    end
  end

  def edit; end

  private

  def load_user_fund
    return if @user_fund = UserFund.find_by(user_id: current_user.id, fund_id: params[:fund_id])
    flash[:error] = t(".user_fund_not_found")
    redirect_to user_funds_path
  end

  def load_statement
    return if @statement = @user_fund.statements.find_by(id: params[:id]).decorate
    flash[:error] = t(".statement_not_found")
    redirect_to fund_statements_path
  end

  def statement_params
    params.require(:statement).permit Statement::STATEMENT_PARAMS
  end
end
