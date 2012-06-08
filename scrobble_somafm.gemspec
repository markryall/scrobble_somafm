# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'scrobble_somafm'
  s.version     = '0.0.1'
  s.authors     = ['Mark Ryall']
  s.email       = ['mark@ryall.name']
  s.homepage    = 'http://github.com/markryall/scrobble_somafm'
  s.summary     = 'command line somafm radio player and scrobbler'
  s.description = <<-EOF
  Plays any somafm radio station by wrapping mplayer, parses track information and sends it to growl and last.fm
  EOF

  s.rubyforge_project = "scrobble_somafm"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency 'nokogiri'
end
