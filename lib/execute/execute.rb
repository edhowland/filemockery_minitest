# execute.rb - execute a process returning an array [stdout, stderr, exit_code]

require 'open3'

def execute(command)
  begin
  outs = ''
    errs = ''
  stdin, stdout, stderr, wait_thr =  Open3.popen3(command) 
  stdin.close
    outs = stdout.read
    errs = stderr.read
    status = wait_thr.value.exitstatus
  rescue => err
    errs = errs + '|' + err.message
    status = 1
  end
  [outs, errs, status]
end

puts "starting #{ARGV.first} command"
output = execute(ARGV.first)
puts 'after'
puts "stdout: |#{output[0]}|"
puts "stderr: |#{output[1]}|"
puts "exit: |#{output[2]}|"
