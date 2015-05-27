# file_unmock_spec.rb - Spec for unmockable.rb

require 'minitest/autorun'
require '../../code/unmockable'

describe 'Mocking File.open' do
  before do
    File.stub(:open, true)
  end
  it 'should have called :open' do
    write_thing_to_file @mock, 'thing'
  end
end
