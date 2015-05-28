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

# Stubs
