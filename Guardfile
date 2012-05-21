# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :cli => "--color --format nested --fail-fast"  do
  watch(%r{^lib/(.+)\.rb$}) { "spec" }
end

