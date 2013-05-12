Given /I am inside a git project/ do
  fail unless File.directory? '.git'
end

And /There are no local user (.*) set/ do |attribute|
  fail unless `git config --local --get user.#{attribute}`.empty?
end
