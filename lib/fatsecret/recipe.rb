class FatSecret
  module Recipe
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def search_recipes(expression, max_results=20)
        query = {
          :method => 'recipes.search',
          :search_expression => expression.esc,
          :max_results => max_results
        }
        get(query)
      end
      
      def recipe(id)
        query = {
          :method => 'recipe.get',
          :recipe_id => id
        }
        get(query)
      end
      
    end
    
  end
end