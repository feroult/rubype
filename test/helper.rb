unless ENV['BUSCAPE_APPLICATION_ID']
  $stderr.puts "Set BUSCAPE_APPLICATION_ID environment variable to your test application id"
  exit -1
end

# helper file
require 'test/unit'
require 'ruby-debug'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubype'

class Test::Unit::TestCase
  def setup
    @application_id = ENV['BUSCAPE_APPLICATION_ID']
  end
end
