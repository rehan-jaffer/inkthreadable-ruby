lib = File.expand_path('./lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

puts $LOAD_PATH

require 'inkthreadable'

Inkthreadable::Setup.configuration do |config|
  config.secret_key = ENV['SECRET_KEY']
end

Inkthreadable::Order::get_json('order.php', {})
