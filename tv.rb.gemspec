Gem::Specification.new do |g|
  g.name        = "tv.rb"
  g.version     = "0.1"
  g.date        = "2015-12-23"
  g.summary     = "CLI emulator of a retro tv's fuzzy flashing patterns."
  g.description = "tv.rb (maybe) CLI emulator of a retro tv's fuzzy flashing in
  the terminal.otherwise just some trippy terminal art that's fun."
  g.author      = "Jeremy Warner"
  g.email       = "jeremywrnr@gmail.com"
  g.homepage    = "http://github.com/jeremywrnr/tv.rb"
  g.license     = "MIT"
  g.executables = ["tv.rb"]
  g.files       = ["lib/tv.rb"]
  g.add_runtime_dependency     "ruby-terminfo", "~> 0.1", ">= 0.1.1"
  g.add_development_dependency "rspec",         "~> 3.3", ">= 3.3.0"
  g.post_install_message = "Turn on the tv with `tv.rb`"
end

