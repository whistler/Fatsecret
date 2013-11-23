require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'initialization' do
    
    before do
      FatSecret.init('1', '2')
    end
    
    it 'saves the authentication data for future calls' do
      FatSecret.class_variable_get(:@@key).should eq('1')
      FatSecret.class_variable_get(:@@secret).should eq('2')
    end
    
  end
  
end
