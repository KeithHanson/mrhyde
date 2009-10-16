require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "mrhyde"
    gem.summary = %Q{Mr. Hyde aims to be a simple yet powerful comment system for Jekyll-based blogs}
    gem.description = %Q{Mr. Hyde is a companion to Jekyll, the blog-aware, static site generator in Ruby. It provides methods of generating the site via github hooks, providing commenting functions, as well as various other niceties.}
    gem.email = "keith@rubyengineer.com[color]"
    gem.homepage = "http://github.com/KeithHanson/mrhyde"
    gem.authors = ["Keith Hanson"]
    gem.add_development_dependency "rspec"
    gem.add_development_dependency "ruby-debug"
    gem.add_dependency('sinatra', '>= 0.9.2')
    gem.add_dependency('haml', '>= 2.2.2')
    gem.add_dependency('ohm', '>= 0.0.25')
    gem.add_dependency('evri_rpx', '>= 1.0.0')
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mrhyde #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
