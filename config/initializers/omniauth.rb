Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, Juggernaut[:consumer_key], Juggernaut[:consumer_secret] 
end