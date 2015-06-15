# execute.rb - execute a process returning an array [stdout, stderr, exit_code]

require 'open3'

def execute(command)
  outs = ''
  errs = ''
  status = 0
Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
    outs = stdout.read
    errs = stderr.read
    status = wait_thr.status
    [outs, errs, status]
end
end


puts 'starting date command'
output = execute('date')
puts 'after date'
puts "stdout: |#{output[0]}|"
puts "stderr: |#{output[1]}|"
puts "exit: |#{output[2]}|"
