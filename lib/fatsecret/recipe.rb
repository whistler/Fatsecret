class FatSecret
  module Recipe
    
    def self.search_recipes(expression,max_results=20)
      query = {
        :method => 'recipes.search',
        :search_expression => expression.esc,
        :max_results => max_results
      }
      get(query)
    end
    
    def self.recipe(id)
      query = {
        :method => 'recipe.get',
        :recipe_id => id
      }
      get(query)
    end
    
  end
end