Pod::Spec.new do |s|

  s.name = 'J2M'
  s.version = '1.2.0'
  s.summary = 'J2M is the json and model transformation framework that is implemented based on the Codable protocol of swift.'

  s.description = <<-DESC
  
               J2M is the json and model transformation framework that is implemented based on the Codable protocol of swift.

               It supports: iOS macOS tvOS

               DESC

  s.homepage = 'https://github.com/Jiar/J2M'
  s.license = { :type => "MIT", :file => "LICENSE" }

  s.author = { "Jiar" => "iiimjiar@gmail.com" }
  s.social_media_url = "https://twitter.com/JiarYoo"

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'

  s.source = { :git => "https://github.com/Jiar/J2M.git", :tag => s.version }
  s.source_files = ["Sources/*.swift", "Sources/J2M.h"]
  s.public_header_files = ["Sources/J2M.h"]

  s.module_name = 'J2M'
  s.requires_arc = true

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  s.static_framework = true

end