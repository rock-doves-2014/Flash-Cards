print "Submitting your score "
percent = 0
(1..100).each{|x| sleep(0.05); print "#{percent+=1}%"}
puts
system 'git add -A > /dev/null 2>&1'
system 'git commit -m "Updated High Scores" > /dev/null 2>&1'
system 'git push origin online_updater > /dev/null 2>&1'