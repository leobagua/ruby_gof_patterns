app_files = File.join("**", "app", "**", "*.rb")
Dir.glob(app_files) .each do |path|
  require File.expand_path(path)
end