# Be sure to restart your server when you modify this file.
Avatar::Application.config.session_store(
  :cookie_store,
  key: '_avatar_session',
  domain: ENV['DOMAIN']
)
