require_relative "../lib/tv"

# just run tv.rb with a bunch of different options and see if it dies.
# this is a pretty bad test suite, but it'll work for now.

def run(cmd)
  TV.new ["--test", cmd.split].flatten
end

%w{-v --version}.each { |w| run w }

patts = %w{bw xmas error pride rasta}

patts.each { |w| run w }

patts.each { |w| run "--wavy " << w }
