require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'update_weight' do
    
    before do
     stub_get('weight.update').
       to_return(:body => fixture('update_weight.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.update_weight('3f57f9258ce64e3f8a55901a747b1370', '2e0324082acb4979950a8e8071f33c7a', 90.75)
      a_get('weight.update').
        should have_been_made
    end
    
  end
  
  describe 'get_month_weights' do
    
    before do
     stub_get('weights.get_month').
       to_return(:body => fixture('get_month_weights.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.get_month_weights('3f57f9258ce64e3f8a55901a747b1370', '2e0324082acb4979950a8e8071f33c7a')
      a_get('weights.get_month').
        should have_been_made
    end
    
  end
  
end
