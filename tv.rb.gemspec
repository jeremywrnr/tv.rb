Gem::Specification.new do |g|
  g.name        = "tv.rb"
  g.version     = "0.3.0"
  g.date        = Time.now.strftime("%Y-%m-%d")
  g.summary     = "CLI emulator of a retro tv's fuzzy flashing patterns."
  g.description = "tv.rb (maybe) CLI emulator of a retro tv's fuzzy flashing in
  the terminal.otherwise just some trippy terminal art that's fun."
  g.author      = "Jeremy Warner"
  g.email       = "jeremywrnr@gmail.com"
  g.homepage    = "http://github.com/jeremywrnr/tv.rb"
  g.license     = "MIT"
  g.executables = ["tv.rb"]
  g.files       = ["lib/tv.rb"]
  g.post_install_message = "Turn on the tv with `tv.rb`"
end
