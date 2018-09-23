# require 'byebug'
class User < ApplicationRecord
    # class << self
    #     def from_omniauth(auth_hash)
    #         user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    #         user.name = auth_hash['info']['name']
    #         user.location = auth_hash['info']['location']
    #         user.image_url = auth_hash['info']['image']
    #         user.url = auth_hash['info']['urls'][user.provider.capitalize]
    #         user.save!
    #         user
    #         # user.password = auth_hash['info']['email']
    #     end
    # end 
    class << self
        def from_omniauth(auth_hash)
            user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
            user.name = auth_hash['info']['name']
            user.email = auth_hash['info']['email']
            user.location = auth_hash['info']['location']
            user.avatar = auth_hash['info']['image']
            unless user.provider == 'facebook'
            user.url = get_social_url_for user.provider, auth_hash['info']['urls']
            end
            user.save!
            user
            # user.location = get_social_location_for user.provider, auth_hash['info']['location'] FOR linkedin doestnt worked
        end
            
            
            

  private

    def get_social_url_for(provider, urls_hash)
            case provider
            when 'linkedin'
                urls_hash['public_profile']
            else
                urls_hash[provider.capitalize]
            end
        end
    end
end
