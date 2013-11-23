require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'autocomplete_food' do
    
    before do
     stub_get('foods.autocomplete').
       to_return(:body => fixture('autocomplete_food.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.autocomplete_food('salmon')
      a_get('foods.autocomplete').
        should have_been_made
    end
    
  end
  
  describe 'food_id_for_barcode' do
    
    before do
     stub_get('food.find_id_for_barcode').
       to_return(:body => fixture('food_id_for_barcode.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.food_id_for_barcode('071279262017')
      a_get('food.find_id_for_barcode').
        should have_been_made
    end
    
  end
  
  describe 'search_food' do
    
    before do
     stub_get('foods.search').
       to_return(:body => fixture('search_food.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.search_food('French Toast')
      a_get('foods.search').
        should have_been_made
    end
    
  end
  
  describe 'food' do
    
    before do
     stub_get('food.get').
       to_return(:body => fixture('food.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.food(4384)
      a_get('food.get').
        should have_been_made
    end
    
  end
  
end
