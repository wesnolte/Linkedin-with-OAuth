LinkedIn.configure do |config|
  config.token = Juggernaut[:consumer_key]
  config.secret = Juggernaut[:consumer_secret]
end