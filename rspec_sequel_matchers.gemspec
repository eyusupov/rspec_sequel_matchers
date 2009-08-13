# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec_sequel_matchers}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jonathan Tron", "Joseph Halter"]
  s.date = %q{2009-08-13}
  s.email = %q{jonathan@tron.name}
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
     "lib/rspec_sequel/association.rb",
     "lib/rspec_sequel/base.rb",
     "lib/rspec_sequel/matchers/have_column.rb",
     "lib/rspec_sequel/matchers/have_many_to_many.rb",
     "lib/rspec_sequel/matchers/have_many_to_one.rb",
     "lib/rspec_sequel/matchers/have_one_to_many.rb",
     "lib/rspec_sequel/matchers/validate_exact_length.rb",
     "lib/rspec_sequel/matchers/validate_format.rb",
     "lib/rspec_sequel/matchers/validate_includes.rb",
     "lib/rspec_sequel/matchers/validate_integer.rb",
     "lib/rspec_sequel/matchers/validate_length_range.rb",
     "lib/rspec_sequel/matchers/validate_max_length.rb",
     "lib/rspec_sequel/matchers/validate_min_length.rb",
     "lib/rspec_sequel/matchers/validate_not_string.rb",
     "lib/rspec_sequel/matchers/validate_numeric.rb",
     "lib/rspec_sequel/matchers/validate_presence.rb",
     "lib/rspec_sequel/matchers/validate_unique.rb",
     "lib/rspec_sequel/validation.rb",
     "lib/rspec_sequel_matchers.rb",
     "rspec_sequel_matchers.gemspec",
     "spec/have_column_matcher_spec.rb",
     "spec/have_many_to_many_matcher_spec.rb",
     "spec/have_many_to_one_matcher_spec.rb",
     "spec/have_one_to_many_matcher_spec.rb",
     "spec/migrations/001_create_items.rb",
     "spec/migrations/002_create_comments.rb",
     "spec/migrations/003_create_comments_items.rb",
     "spec/spec_helper.rb",
     "spec/validate_exact_length_matcher_spec.rb",
     "spec/validate_format_matcher_spec.rb",
     "spec/validate_includes_matcher_spec.rb",
     "spec/validate_integer_matcher_spec.rb",
     "spec/validate_length_range_matcher_spec.rb",
     "spec/validate_max_length_matcher_spec.rb",
     "spec/validate_min_length_matcher_spec.rb",
     "spec/validate_not_string_matcher_spec.rb",
     "spec/validate_numeric_matcher_spec.rb",
     "spec/validate_presence_matcher_spec.rb",
     "spec/validate_unique_matcher_spec.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/JonathanTron/rspec_sequel_matchers}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/have_column_matcher_spec.rb",
     "spec/have_many_to_many_matcher_spec.rb",
     "spec/have_many_to_one_matcher_spec.rb",
     "spec/have_one_to_many_matcher_spec.rb",
     "spec/migrations/001_create_items.rb",
     "spec/migrations/002_create_comments.rb",
     "spec/migrations/003_create_comments_items.rb",
     "spec/spec_helper.rb",
     "spec/validate_exact_length_matcher_spec.rb",
     "spec/validate_format_matcher_spec.rb",
     "spec/validate_includes_matcher_spec.rb",
     "spec/validate_integer_matcher_spec.rb",
     "spec/validate_length_range_matcher_spec.rb",
     "spec/validate_max_length_matcher_spec.rb",
     "spec/validate_min_length_matcher_spec.rb",
     "spec/validate_not_string_matcher_spec.rb",
     "spec/validate_numeric_matcher_spec.rb",
     "spec/validate_presence_matcher_spec.rb",
     "spec/validate_unique_matcher_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<sequel>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<sequel>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<sequel>, [">= 0"])
  end
end
