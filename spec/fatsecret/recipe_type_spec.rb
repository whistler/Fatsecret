require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'get_recipe_types' do
    
    before do
     stub_get('recipe_types.get').
       to_return(:body => fixture('get_recipe_types.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.get_recipe_types
      a_get('recipe_types.get').
        should have_been_made
    end
    
  end
  
end
