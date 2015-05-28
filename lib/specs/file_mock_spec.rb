# file_mock_spec.rb - Spec for file_mock

require 'minitest/autorun'
require '../mocks/file_mocker'
require '../../code/mockable'

describe 'Mocking File.open' do
  before do
    @mock = file_mocker('/tmp/users/homeboy/thing.txt', 'w') do |fmock|
      fmock.expect(:write, nil, ['thing'])
    end
  end
  it 'should have called :open' do
    _write_thing_to_file @mock, 'thing'
    @mock.verify
  end
end
