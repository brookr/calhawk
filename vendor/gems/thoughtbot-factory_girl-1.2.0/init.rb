
require_options = ["thoughtbot-factory_girl", "factory_girl"]
if require_lib = require_options.find { |path|  File.directory?(File.join(File.dirname(__FILE__), 'lib', path)) }
  require File.join(File.dirname(__FILE__), 'lib', require_lib)
else
  puts msg = "ERROR: Please update #{File.expand_path __FILE__} with the require path for linked RubyGem thoughtbot-factory_girl"
  exit
end

