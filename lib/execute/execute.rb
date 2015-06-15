# execute.rb - execute a process returning an array [stdout, stderr, exit_code]

def execute(command)
Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
end
end

