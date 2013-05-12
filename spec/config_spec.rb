require 'spec_helper'

describe 'Proteus::Config' do
  describe '#load_conf' do
    let(:conf) { Proteus::Config.new() }

    context 'When there is no file to load' do
      it { expect{conf.load_conf('fake_file.yml')}.to raise_error}
    end

    context 'When there is a file' do
      it "loads the yaml into a config" do
        conf_file = ('spec/test_data/example_config.yaml')
        conf.load_conf(conf_file)
        expect(conf.config['data'].empty?).to be_false
      end
    end
  end
end
