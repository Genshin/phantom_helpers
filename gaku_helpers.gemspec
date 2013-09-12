# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'gaku_helpers'
  s.version     = '0.0.6'
  s.summary     = 'Gaku View Helpers'
  s.description = ''
  s.required_ruby_version = '>= 1.8.7'

  s.author            = ['Rei Kagetsuki', 'Nakaya Yukiharu', 'Vassil Kalkov']
  s.email             = 'info@genshin.org'
  s.homepage          = 'http://github.com/Genshin/gaku_helpers'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")

  s.require_path = 'lib'
  s.requirements << 'none'
end
