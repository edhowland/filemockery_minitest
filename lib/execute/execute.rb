# execute.rb - execute a process returning an array [stdout, stderr, exit_code]

require 'open3'
require 'thwait'

def execute(command)
  stdin, stdout, stderr, wait_thr =  Open3.popen3(command) 
  stdin.close
    outs = stdout.read
    errs = stderr.read
  #ThreadsWait.all_waits wait_thr
  status = wait_thr.value.exitstatus
    [outs, errs, status]
end

puts "starting #{ARGV.first} command"
output = execute(ARGV.first)
puts 'after'
puts "stdout: |#{output[0]}|"
puts "stderr: |#{output[1]}|"
puts "exit: |#{output[2]}|"
