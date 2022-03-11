Pod::Spec.new do |s|
  s.name             = 'HeightPickerView'
  s.version          = '1.0.1'
  s.summary          = 'A short description of HeightPickerView.'
  s.homepage         = 'https://github.com/sunkeeper316/HeightPickerView'
  s.license          = { :type => 'MIT', :file => 'License.md' }
  s.author           = { 'sunkeeper316' => 'sunkeeper316@gmail.com' }
  s.source           = { :git => 'https://github.com/sunkeeper316/HeightPickerView.git', :tag => s.version }
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/HeightPickerView/**/*.swift'
end
