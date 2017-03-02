require 'simplecov'
require 'fakeweb'
require 'vcr'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'inkthreadable'


VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :fakeweb # or :fakeweb
end
