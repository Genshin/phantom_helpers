# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'phantom_helpers'
  s.version     = '0.0.6'
  s.summary     = 'Phantom View Helpers'
  s.description = 'rails helpers for bootstrap 3'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = ['Vassil Kalkov', 'Rei Kagetsuki', 'Nakaya Yukiharu']
  s.email             = 'info@genshin.org'
  s.homepage          = 'http://github.com/Genshin/phantom_helpers'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")

  s.require_path = 'lib'
  s.requirements << 'none'
end
