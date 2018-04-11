Pod::Spec.new do |s|
  s.name        = "KituraTemplateEngine"
  s.version     = "1.7.3"
  s.summary     = "The Kitura template engine abstraction layer"
  s.homepage    = "https://github.com/IBM-Swift/Kitura-TemplateEngine"
  s.license     = { :type => "Apache License, Version 2.0" }
  s.author     = "IBM"
  s.module_name  = 'KituraTemplateEngine'

  s.requires_arc = true
  s.osx.deployment_target = "10.11"
  s.ios.deployment_target = "10.0"
  s.tvos.deployment_target = "10.0"
  s.source   = { :git => "https://github.com/IBM-Swift/Kitura-TemplateEngine.git", :tag => s.version }
  s.source_files = "Sources/KituraTemplateEngine/*.swift"
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '4.0.3',
  }
end