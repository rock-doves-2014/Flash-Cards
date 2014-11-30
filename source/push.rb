print "Submitting your score"
(1..20).each{|x| sleep(0.1); print "."}
system 'git add -A > /dev/null 2>&1'
system 'git commit -m "Updated High Scores" > /dev/null 2>&1'
system 'git push origin online_updater > /dev/null 2>&1'