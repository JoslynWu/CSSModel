Pod::Spec.new do |s|
  s.name         = "CSSModel"
  s.version      = "0.0.5"
  s.summary      = "A simple data to model framework. \n 一个简约的转Model工具。"
  s.license      = { :type => 'MIT License', :file => 'LICENSE' }
  s.authors      = { 'Joslyn' => 'cs_joslyn@foxmail.com' }
  s.homepage     = 'https://github.com/JoslynWu/CSSModel'
  s.social_media_url   = "http://www.jianshu.com/u/fb676e32e2e9"
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/JoslynWu/CSSModel.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'CSSModel/*.{h,m}'
  s.public_header_files = 'CSSModel/*.{h}'
end
