Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
     :scope => 'email', info_fields: 'email, name,link'
    
    provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET'],
    scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online'
    provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'],
  scope: 'r_basicprofile',
  fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']


  OmniAuth.config.on_failure = Proc.new do |env|
  SessionsController.action(:auth_failure).call(env)
end

end