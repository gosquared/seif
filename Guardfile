guard 'minitest', :notify => false do
  watch(%r|^test/(.*)_test\.rb|)
  watch(%r|^lib/seif/(.*)([^/]+)\.rb|)     { |m| "test/#{m[1]}#{m[2]}_test.rb" }
  watch(%r|^test/test_helper\.rb|)    { "test" }
end
