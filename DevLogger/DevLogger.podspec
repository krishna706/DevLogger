
Pod::Spec.new do |s|

  s.name           = "DevLogger"
  s.version         = "1.0.0"
  s.summary      = "This is a DevLogger."
  s.description   = "Devgang Logger which can access logs and show you with neat design"
  s.homepage    = "https://github.com/krishna706/DevLogger.git"
  s.license          = "MIT"
  s.author           = { "radha" => "radha@param-solutions.com" }
  s.platform        = :ios, "11.0"
s.source          = { :git => "https://github.com/krishna706/DevLogger.git", :tag => "1.0.0" }
  s.source_files  = "DevLogger/**/*"
end
