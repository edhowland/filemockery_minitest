# file_mocker.rb - method file_mocker(filename, mode, &blk)

require 'minitest/mock'

# file_mocker - call with
# expected filenamem a mode : 'w', 'r' and an optional block to expect
# file contents
def file_mocker(name, mode, &blk)
  fmock = MiniTest::Mock.new
  blk.call((fmock))
  mock = MiniTest::Mock.new
  mock.expect(:open, true) do |a1, a2, &block|
    block.call(fmock)
    a1 == name && a2 == mode && fmock.verify
  end
  mock
end
