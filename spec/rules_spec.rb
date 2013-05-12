require 'spec_helper'
require 'proteus/rules'

describe 'Proteus::Rules' do
  describe '::match' do
    let(:rulesobj) do 
      # These stubs just returns whatever the argument is.
      rules = Proteus::Rules.new
      rules.stub(:matcher01) { |arg| arg }
      rules.stub(:matcher02) { |arg| arg }
      rules.stub(:matcher03) { |arg| arg }
      rules
    end

    context 'when a single rule is true' do
      it 'returns true' do
        rules = {'matcher01' => true}
        expect(rulesobj.match(rules)).to be_true
      end
    end

    context 'when all rules are true' do
      it 'returns true' do
        rules = {'matcher01' => true,
                 'matcher02' => true,
                 'matcher03' => true }
        expect(rulesobj.match(rules)).to be_true
      end
    end

    context 'when just one rule is false' do
      it 'returns false' do
        rules = {'matcher01' => true,
                 'matcher02' => false,
                 'matcher03' => true }
        expect(rulesobj.match(rules)).to be_false
      end
    end
  end
end
