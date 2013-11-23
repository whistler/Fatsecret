class FatSecret
  module Weight
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def update_weight(oauth_token, oauth_secret, current_weight_kg, options={})
        query = {
          :method => 'weight.update',
          :oauth_token => oauth_token,
          :oauth_secret => oauth_secret,
          :current_weight_kg => current_weight_kg
        }
        get(query.merge(options))
      end
      
      def get_month_weights(oauth_token, oauth_secret, date=nil)
        query = {
          :method => 'weights.get_month',
          :oauth_token => oauth_token,
          :oauth_secret => oauth_secret,
          :date => date
        }
        get(query)
      end
      
    end
    
  end
end