require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'create_profile' do
    
    before do
     stub_get('profile.create').
       to_return(:body => fixture('create_profile.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.create_profile
      a_get('profile.create').
        should have_been_made
    end
    
  end
  
  describe 'profile' do
    
    before do
     stub_get('profile.get').
       to_return(:body => fixture('profile.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.profile('639aa3c886b849d2811c09bb640ec2b3')
      a_get('profile.get').
        should have_been_made
    end
    
  end
  
  describe 'get_auth' do
    
    before do
     stub_get('profile.get_auth').
       to_return(:body => fixture('get_auth.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.get_auth(1)
      a_get('profile.get_auth').
        should have_been_made
    end
    
  end
  
end
