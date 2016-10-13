
Pod::Spec.new do |s|
  s.name             = 'LwDatePicker'
  s.version          = '0.1.2'
  s.summary          = '自定义时间选择器'

  s.description      = <<-DESC
自定义时间选择器，可以定义yyyy-MM-dd:hh:mm:ss
                       DESC

  s.homepage         = 'https://github.com/guakeliao/LwDatePicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liaowei' => '598951856@qq.com' }
  s.source           = { :git => 'https://github.com/guakeliao/LwDatePicker.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'LwDatePicker/Classes/**/*'

end
