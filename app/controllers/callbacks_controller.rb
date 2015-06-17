class CallbacksController < ApplicationController
  def slack
    puts "PLOMP!"
    puts request.env["omniauth.auth"]
    @member = Member.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @member
  end

  def failure
    puts "-FAILURE-FAILURE-FAILURE-FAILURE-FAILURE-FAILURE-"
    set_flash_message :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
    redirect_to after_omniauth_failure_path_for(resource_name)
  end

  def failed_strategy
    env["omniauth.error.strategy"]
  end

  protected

  def failure_message
    exception = env["omniauth.error"]
    error   = exception.error_reason if exception.respond_to?(:error_reason)
    error ||= exception.error        if exception.respond_to?(:error)
    error ||= env["omniauth.error.type"].to_s
    error.to_s.humanize if error
  end

  def after_omniauth_failure_path_for(scope)
    new_session_path(scope)
  end

  def translation_scope
    'devise.omniauth_callbacks'
  end

  def handle_unverified_request
    true
  end
end
