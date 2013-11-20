class FatSecret
  module RecipeType
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def get_recipe_types
        query = {
          :method => 'recipe_types.get',
        }
        get(query)
      end
      
    end
    
  end
end