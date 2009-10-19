# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mrhyde}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Keith Hanson"]
  s.date = %q{2009-10-18}
  s.default_executable = %q{mrhyde}
  s.description = %q{Mr. Hyde is a companion to Jekyll, the blog-aware, static site generator in Ruby. It provides methods of generating the site via github hooks, providing commenting functions, as well as various other niceties.}
  s.email = %q{keith@rubyengineer.com[color]}
  s.executables = ["mrhyde"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/mrhyde",
     "lib/mrhyde.rb",
     "lib/mrhyde.ru",
     "lib/mrhyde/database/.gitignore",
     "lib/mrhyde/main.rb",
     "lib/mrhyde/mrhyde.rb",
     "mrhyde.gemspec",
     "spec/mrhyde_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/KeithHanson/mrhyde}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Mr. Hyde aims to be a simple yet powerful comment system for Jekyll-based blogs}
  s.test_files = [
    "spec/mrhyde_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.2"])
      s.add_runtime_dependency(%q<haml>, [">= 2.2.2"])
      s.add_runtime_dependency(%q<ohm>, [">= 0.0.25"])
      s.add_runtime_dependency(%q<evri_rpx>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<jekyll>, [">= 0.5.4"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0.9.2"])
      s.add_dependency(%q<haml>, [">= 2.2.2"])
      s.add_dependency(%q<ohm>, [">= 0.0.25"])
      s.add_dependency(%q<evri_rpx>, [">= 1.0.0"])
      s.add_dependency(%q<jekyll>, [">= 0.5.4"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0.9.2"])
    s.add_dependency(%q<haml>, [">= 2.2.2"])
    s.add_dependency(%q<ohm>, [">= 0.0.25"])
    s.add_dependency(%q<evri_rpx>, [">= 1.0.0"])
    s.add_dependency(%q<jekyll>, [">= 0.5.4"])
  end
end
