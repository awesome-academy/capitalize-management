class UserDecorator < ApplicationDecorator
  delegate_all

  def user_badge
    return {name: I18n.t("decorators.user.exist"),class: "badge badge-outline-primary badge-pill"} if id
    {name: I18n.t("decorators.user.not_exist"),class: "badge badge-outline-success badge-pill"}
  end
end
