puts "Submitting your score..."
system 'git add -A'
system 'git commit -m "Updated High Scores"'
system 'git push origin online_updater'