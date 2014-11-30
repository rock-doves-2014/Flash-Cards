puts "Submitting your score..."
system 'git add -A > /dev/null'
system 'git commit -m "Updated High Scores" > /dev/null'
system 'git push origin online_updater > /dev/null'