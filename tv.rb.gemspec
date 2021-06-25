lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require_relative "lib/version"

Gem::Specification.new do |g|
  g.author      = "Jeremy Warner"
  g.email       = "jeremywrnr@gmail.com"
  g.name        = "tv.rb"

  g.version     = TV::Version
  g.platform    = Gem::Platform::RUBY
  g.date        = Time.now.strftime("%Y-%m-%d")

  g.summary     = "CLI emulator of a retro tv's fuzzy flashing patterns."
  g.description = "tv.rb (maybe) CLI emulator of a retro tv's fuzzy flashing in the terminal.otherwise just some trippy terminal art that's fun."
  g.homepage    = "http://github.com/jeremywrnr/tv.rb"
  g.license     = "MIT"

  g.add_development_dependency "rake"
  g.files       = ["lib/tv.rb"]
  g.executables = ["tv.rb"]
  g.require_path = "lib"
end

