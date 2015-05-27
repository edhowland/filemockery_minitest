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
  def write_thing_to_file thing
    File.open('/tmp/users/homeboy/thing.txt', 'w') do |f|
      # ... complicated computation
      f.write result
    end
  end
```

