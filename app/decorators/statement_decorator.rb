class StatementDecorator < ApplicationDecorator
  delegate_all

  def status_tag
    return {name: I18n.t("decorators.statement.succeed"), class: "badge badge-success"} if status
    {name: I18n.t("decorators.statement.unsucceed"), class: "badge badge-danger"}
  end

  def guess_tag
    return {name: I18n.t("decorators.statement.up"), class: "badge badge-success"} if
      guess
    {name: I18n.t("decorators.statement.down"), class: "badge badge-danger"}
  end
end
