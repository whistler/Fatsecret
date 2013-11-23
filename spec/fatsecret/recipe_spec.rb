require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'search_recipes' do
    
    before do
     stub_get('recipes.search').
       to_return(:body => fixture('search_recipes.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.search_recipes('Snapper')
      a_get('recipes.search').
        should have_been_made
    end
    
  end
  
  describe 'recipe' do
    
    before do
     stub_get('recipe.get').
       to_return(:body => fixture('recipe.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.recipe(91)
      a_get('recipe.get').
        should have_been_made
    end
    
  end
  
end
