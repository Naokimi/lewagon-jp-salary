# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      if github_user.persisted? && User::LW_JAPAN_USERS.include?(github_user.github_username)
        sign_in_and_redirect github_user, event: :authentication
        flash.notice = 'Successfully signed in with GitHub!'
      elsif github_user.persisted?
        redirect_to root_path
        flash.alert = "You aren't a LW Japan alumni. If incorrect please #{contact_me}."
      else
        redirect_to root_path
        flash.alert = "For an unknown reason, we couldn't store your information in our database. Please #{contact_me}."
      end
    end

    private

    def github_user
      @github_user ||= User.from_omniauth(request.env['omniauth.auth'])
    end

    def contact_me
      view_context.link_to(
        'contact Paulo',
        'https://lewagon-alumni.slack.com/team/UHVHWDZ8C',
        class: 'underline'
      )
    end
  end
end
