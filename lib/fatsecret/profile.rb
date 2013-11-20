class FatSecret
  module Profile
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def create_profile
        query = {
          :method => 'profile.create'
        }
        get(query)
      end
      
      def profile(oauth_token)
        query = {
          :method => 'profile.get',
          :oauth_token => oauth_token
        }
        get(query)
      end
      
      def get_auth(user_id)
        query = {
          :method => 'profile.get_auth',
          :user_id => user_id
        }
        get(query)
      end
      
    end
    
  end
end