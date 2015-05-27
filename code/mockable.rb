# mockable.rb  - Code  little easier to mock

def write_thing_to_file thing
  _write_thing_to_file File, thing
end

def _write_thing_to_file file, thing
  file.open('/tmp/users/homeboy/thing.txt', 'w') do |f|
    # ... complicated computation

    f.write result
  end
end
