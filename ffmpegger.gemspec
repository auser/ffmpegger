Gem::Specification.new do |s|
  s.name = %q{ffmpegger}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ari Lerner"]
  s.date = %q{2008-12-19}
  s.description = %q{High quality video editing DSL}
  s.email = ["arilerner@mac.com"]
  s.files = ["test/test_ffmpegger.rb", "test/test_helper.rb", "test/test_live.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://ffmpegger.rubyforge.org}
  s.post_install_message = %q{
For more information on ffmpegger, see http://ffmpegger.rubyforge.org

NOTE: Change this information in PostInstall.txt 
You can also delete it if you don't want it.


}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ffmpegger}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{High quality video editing DSL}
  s.test_files = ["test/test_ffmpegger.rb", "test/test_helper.rb", "test/test_live.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end