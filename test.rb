lib = File.expand_path('./lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

puts $LOAD_PATH

require 'inkthreadable/order'

Inkthreadable::Order::get_json('order.php', {})
