# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "freegana/version"

Gem::Specification.new do |s|
  s.name        = "freegana"
  s.version     = Freegana::VERSION
  s.authors     = ["Bryan McKelvey"]
  s.email       = ["bryan.mckelvey@gmail.com"]
  s.homepage    = "http://www.brymck.com"
  s.summary     = %q{Transliterates kana to Roman characters}
  s.description = %q{Transliterates kana to Roman characters}

  s.rubyforge_project = "freegana"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
