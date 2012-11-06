# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_news'
  s.version     = '0.1.0'
  s.summary     = 'Adds  anews field, that show a max of 3 news entries'
  s.description = 'Provides an Admin view to create/edit posts which will be shown on the home page.'
  s.required_ruby_version = '>= 1.9.2'

  s.author            = 'JD Warren'
  s.email             = 'jd@isotope11.com'
  s.homepage          = 'http://github.com/johndavid400/spree_news'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core'
  s.add_dependency 'haml'
  s.add_dependency 'ckeditor-rails'
end
