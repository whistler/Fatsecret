require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'get_exercises' do
    
    before do
     stub_get('exercises.get').
       to_return(:body => fixture('get_exercises.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.get_exercises
      a_get('exercises.get').
        should have_been_made
    end
    
  end
  
end
