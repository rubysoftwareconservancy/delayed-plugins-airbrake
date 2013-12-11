# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed-plugins-airbrake/version'

Gem::Specification.new do |gem|
  gem.name          = "delayed-plugins-airbrake"
  gem.version       = Delayed::Plugins::Airbrake::VERSION
  gem.authors       = ['Benjamin Oakes', 'Romain Champourlier', 'Grant Hollingworth', 'Nathan Broadbent']
  gem.email         = ['hello@benjaminoakes.com']
  gem.description   = %q(delayed_job exception notification with airbrake)
  gem.summary       = %q(Notify Airbrake on Delayed Job errors, including those on PerformableMethod.  Packaged for use from https://gist.github.com/granth/2223758 and http://stackoverflow.com/questions/12683364/how-to-make-delayed-job-notify-airbrake-when-an-actionmailer-runs-into-an-error.)
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # Dependencies are not using versions so that there are few version conflicts for users.
  gem.add_dependency('airbrake')
  gem.add_dependency('delayed_job')

  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
end
