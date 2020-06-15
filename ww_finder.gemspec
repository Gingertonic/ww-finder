lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ww_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "ww_finder"
  spec.version       = WWFinder::VERSION
  spec.authors       = ["Gingertonic"]
  spec.email         = ["bethmschofield@gmail.com"]
  spec.license       = 'MIT'

  spec.summary       = %q{Find a Wework}
  spec.description   = %q{Find a Wework anywhere in the world! Search by continent, country and city.}
  spec.homepage      = "https://github.com/Gingertonic/ww-finder"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/gem/ww_finder"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Gingertonic/ww-finder"
  spec.metadata["changelog_uri"] = "https://github.com/Gingertonic/ww-finder/commits/master"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   << 'ww-finder'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", '~> 12.3', '>= 12.3.3'
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
  spec.add_dependency "tty-table"
end
