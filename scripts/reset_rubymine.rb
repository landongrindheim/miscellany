print "What is your username: "
username = gets.chomp

rubymine_processes = []

all_processes = IO.popen("ps -ef | grep #{username}")

all_processes.each_line do |process|
  if (process.match("RubyMine") || process.match("rails"))
	rubymine_processes << process
  end
end

pids = rubymine_processes.map { |p| p[/\d{3,}/] }

pids.each do |pid| 
  %x( kill #{pid} )
end
