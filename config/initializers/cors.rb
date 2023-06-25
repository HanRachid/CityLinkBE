Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Adjust this to the appropriate origin or origins
      resource '*', headers: :any, methods: [:get]
    end
  end