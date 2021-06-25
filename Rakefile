require_relative "lib/version"
require "rspec/core/rake_task"
require "rake"

task :default => :spec

# gem name, version
g = "tv.rb"
v = TV::Version

task :build do
  system "gem build #{g}.gemspec"
  system "gem install ./#{g}-#{v}.gem"
end

task :clean do
  puts "cleaning gems..."
  system "rm -fv *.gem"
end

task :push => [:clean, :build] do
  system "gem push #{g}-#{v}.gem"
end

RSpec::Core::RakeTask.new(:spec) do |rake|
  rake.verbose = true
  rake.rspec_opts = "--color --format documentation"
end
