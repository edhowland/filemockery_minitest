# filemockery_minitest
Mocks and Stubs test doubles for MiniTest::Mock

# Prelude
Rationale: I could find anything about this in Google. So I wrote my thoughts and code.
Assume you have a Brown filed project with no tests. You want to add some tests, but running the code will files, database rows and other detritus around. It would be nice to fake out the side effects without needing to rewrite much or any of the code.

# Installation.
TODO: Write up how to install this thing.

# Starting Point
Assume at the end of long chain of calls, you find this:
```
  write_thing_to_file thing
```
And then, you find the method:
```

def write_thing_to_file(thing)
  File.open('/tmp/users/homeboy/thing.txt', 'w') do |f|
    # ... complicated computation

    result = thing
    f.puts result
  end
end
```

This is all kinds of bad news. First it is all side-effect. And top it off the path 
is a magic full path. It is unlikely your test enviornment will have that firectory.
Testing this code would seem hard. But there is a way:

## Test Doubles

Test doubles are stand-ins for code you don't want to test, but are called be code you wat to test.
Some types of doubles are : mocks, stubs and fakes.

# Mocks

Mocks are a test double that replaces actual objects in your code vut only do what 
you want instead of the real object. Since Ruby is Duck-typed, you only have to 
fake out the messages that are expected to be called. You don't have to re-implement the full class of the object.

Let's see how to test our code above. First we need to do a slight refactor to allow our mock to be injected in place of the 'File' class:

```
# mockable.rb  - Code  little easier to mock

def write_thing_to_file(thing)
  _write_thing_to_file(File, thing)
end

def _write_thing_to_file(file, thing)
  file.open('/tmp/users/homeboy/thing.txt', 'w') do |f|
    # ... complicated computation
    result = thing

    f.write result
  end
end
```

Now let's see how to mock the 'File' class. We will be using MiniTest::Spec for this example.
```

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
```

There are 2 mocks going on here: @mock and fmock within the block for file_mocker(). @mock is the mock double for File. fmock is the double for the 'f' 
parameter to the block to the file.open() in out code under test. The method file_mocker takes a file, a mode ('w' or 'r') and 
an optional block. The @mock.verify checks that all the arguements to open are as expevted. The block takes another parameter which we
have named fmock here. This is an internal mock that gests substituted for the file
object passed to the optional block to File.open



# Stubs
