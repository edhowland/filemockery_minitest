
require 'rspec'


#allow(book).to receive(:title) { "The RSpec Book" }
#allow(book).to receive(:title).and_return("The RSpec Book")
#allow(book).to receive_messages(
    #:title => "The RSpec Book",
    #:sub

#allow(MyMod::Utils).to receive(:find_x).and_return({something: 'testing'})


RSpec.describe File do
  context 'with stub' do
    it 'should stub' do
        allow(File).to receive(:open).and_return(true)
      File.open('stub', 'w') do |f|
        f.puts 'hi'
      end
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
