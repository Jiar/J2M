Pod::Spec.new do |s|

  s.name = "J2M"
  s.version = "1.0.0"
  s.summary = "基于swift4的Codable协议实现的json与model互相转换框架"

  s.homepage = "https://github.com/Jiar/J2M"
  s.license = { :type => "MIT", :file => "LICENSE" }

  s.author = { "Jiar" => "jiar.world@gmail.com" }
  s.social_media_url   = "https://twitter.com/JiarYoo"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"

  s.source = { :git => "https://github.com/Jiar/J2M.git", :tag => s.version }
  s.source_files = ["Sources/*.swift", "Sources/J2M.h"]
  s.public_header_files = ["Sources/J2M.h"]

  s.module_name = 'J2M'
  s.requires_arc = true

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
end
