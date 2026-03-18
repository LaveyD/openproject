Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '119.96.30.33'  # 生产环境请改为具体域名
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false
  end
end
