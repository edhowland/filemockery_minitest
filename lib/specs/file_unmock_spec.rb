# file_unmock_spec.rb - Spec for unmockable.rb

require 'minitest/autorun'
require '../mocks/file_mocker'
require '../../code/unmockable'

describe 'Mocking File.open' do
  before do
  end
  it 'should have called :open' do
    class File
      def self.open(fname, mode, &blk)
      true
      end
    end
    write_thing_to_file 'thing'
  end
end
