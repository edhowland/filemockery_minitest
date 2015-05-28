
require 'fileutils'
require 'rspec'
require '../../code/unmockable'

RSpec.describe File do
  context 'with stub' do
    before(:each) do
        allow(File).to receive(:open).and_return(true)
    end
    it 'should stub' do
      write_thing_to_file 'thing'
      expect(File).not_to exist('/tmp/users/homeboy/thing.txt')
    end
  end

  context 'with no stub' do
    it 'should write file' do
      File.open('nostub', 'w') do |f|
        f.puts 'hi'
      end
      expect(File).to exist('nostub')
    end
  end
end
