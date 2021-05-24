Dir.glob('test_*.rb', base: __dir__) do |test_file|
  require_relative test_file
end
