# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_record/uuid/version"

Gem::Specification.new do |s|
  s.name        = "activerecord-uuid"
  s.version     = ActiveRecord::Uuid::VERSION
  s.authors     = ["Philip Champon", "Nathan Bryan"]
  s.email       = ["pchampon@gmail.com", "nathan.bryan@gmail.com"]
  s.homepage    = "http://github.com/adaptly/activerecord-uuid"
  s.summary     = %q{Bundles all UUID for ActiveRecord and Postgres}
  s.description = %q{Installs blah blah blah}

  s.rubyforge_project = "activerecord-uuid"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  v = "~> 3.2.10"
  s.add_dependency 'activerecord', v
  s.add_dependency 'activesupport', v
  s.add_dependency "railties", v

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
end
