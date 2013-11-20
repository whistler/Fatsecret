class FatSecret
  module ExerciseEntry
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def get_exercise_entries(oauth_token, oauth_secret)
        query = {
          :method => 'exercise_entries.get',
          :oauth_token => oauth_token,
          :oauth_secret => oauth_secret
        }
        get(query)
      end
      
    end
    
  end
end