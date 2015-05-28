# unmockable.rb  - Code too hard to mock

def write_thing_to_file(thing)
  File.open('/tmp/users/homeboy/thing.txt', 'w') do |f|
    # ... complicated computation

    result = thing
    f.puts result
  end
end
