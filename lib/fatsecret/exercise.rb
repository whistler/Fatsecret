class FatSecret
  module Exercise
    
    def self.get_exercises
      query = {
        :method => 'exercises.get',
      }
      get(query)
    end
    
  end
end