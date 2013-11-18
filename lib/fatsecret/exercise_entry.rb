class FatSecret
  module ExerciseEntry
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def get_exercise_entries(oauth_token)
        query = {
          :method => 'exercise_entries.get',
          :oauth_token => oauth_token
        }
        get(query)
      end
      
    end
    
  end
end