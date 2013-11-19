class FatSecret
  module Weight
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def update_weight(oauth_token, current_weight_kg, options={})
        query = {
          :method => 'weight.update',
          :oauth_token => oauth_token,
          :current_weight_kg => current_weight_kg
        }
        get(query.merge(options))
      end
      
      def get_month_weights(oauth_token, date=nil)
        query = {
          :method => 'weights.get_month',
          :oauth_token => oauth_token,
          :date => date
        }
        get(query)
      end
      
    end
    
  end
end