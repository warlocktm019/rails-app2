# frozen_string_literal: true

Apipie.configure do |config|
  config.app_name                = 'QaseeExternalApiServer'
  config.api_base_url            = '/'
  config.doc_base_url            = '/apipie'
  # where is your API defined?
  # config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.api_controllers_matcher = Rails.root.join('app/controllers/**/*.rb')
  # config.default_locale = 'ja'
  config.translate = false
  # config.languages = %w[en ja]
end
