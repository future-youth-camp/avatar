# Be sure to restart your server when you modify this file.

if Rails.env == 'production'
  domain = 'fyc.camp'
else
  domain = 'localhost:3000'
end

Rails.application.config.session_store :cookie_store, key: '_avatar_session', domain: domain
