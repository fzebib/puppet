require 'spec_helper'
describe 'remove' do

  context 'with defaults for all parameters' do
    it { should contain_class('remove') }
  end
end
