require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'get_exercises' do
    
    before do
     stub_get('exercise_entries.get').
       to_return(:body => fixture('get_exercise_entries.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.get_exercise_entries('2e0324082acb4979950a8e8071f33c7a', '2e0324082acb4979950a8e8071f33c7a')
      a_get('exercise_entries.get').
        should have_been_made
    end
    
  end
  
end
