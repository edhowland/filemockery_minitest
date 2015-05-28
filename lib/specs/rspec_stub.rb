
require 'fileutils'
require 'rspec'
require '../../code/unmockable'

RSpec.describe File do
  context 'with stub' do
    before(:each) do
      FileUtils.rm_f './stub'
        allow(File).to receive(:open).and_return(true)
    end
    it 'should stub' do
      File.open('stub', 'w') do |f|
        f.puts 'hi'
      end
      expect(File).not_to exist('stub')
    end

  context 'with no stub' do
    it 'should write file' do
      File.open('nostub', 'w') do |f|
        f.puts 'hi'
      end
    end
  end
  end
end
