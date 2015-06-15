# execute.rb - execute a process returning an array [stdout, stderr, exit_code]

require 'open3'
require 'thwait'

def execute(command)
  outs = ''
  errs = ''
  status = 0
  stdin, stdout, stderr, wait_thr =  Open3.popen3(command) 
  stdin.close
    outs = stdout.read
    errs = stderr.read
  ThreadsWait.all_waits wait_thr
    status = wait_thr.status
    [outs, errs, status]
end


puts 'starting date command'
output = execute(ARGV.first)
puts 'after date'
puts "stdout: |#{output[0]}|"
puts "stderr: |#{output[1]}|"
puts "exit: |#{output[2].class.name}|"
