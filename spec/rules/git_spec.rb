require 'spec_helper'
require 'Proteus/rules/git'

describe 'Proteus::Rules::Git' do
  describe 'RemoteOrigin' do 
    describe 'input value' do
      let(:matcher) do
        test_output = {'remote.origin.url' => 'http://test.example.com'}
        grit = double(:grit)
        grit.stub(:config => test_output)
        obj = Proteus::Rules::Git::RemoteOrigin.new()
        obj.repo = grit
        obj
      end

      context 'is an exact url' do
        value = 'http://test.example.com/project'
        it {expect(matcher.match(value)).to be_true}
      end

      context 'has a different scheme' do
        value = 'https://test.example.com/project'
        it {expect(matcher.match(value)).to be_true}
      end

      context 'is a different url' do
        value = 'http://test.com/project'
        it {expect(matcher.match(value)).to_not be_true}
      end
      
      # This will likely change
      context 'has a user name' do
        value = 'http://testuser@test.example.com/project'
        it {expect(matcher.match(value)).to be_true}
      end

      context 'does not have a scheme and with a colon' do
        value = 'testuser@test.example.com:project/projectone'
        it {expect(matcher.match(value)).to be_true}
      end

      context 'is just a host name' do
        value = 'test.example.com'
        it {expect(matcher.match(value)).to be_true}
      end
    end
  end
end
