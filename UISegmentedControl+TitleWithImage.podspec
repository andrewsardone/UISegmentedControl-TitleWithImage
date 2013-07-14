Pod::Spec.new do |s|
  s.name         = 'UISegmentedControl+TitleWithImage'
  s.summary      = 'A UISegmentedControl extension that allows for displaying both an image and a title simultaneously.'
  s.homepage     = 'https://github.com/andrewsardone/UISegmentedControl-TitleWithImage'
  s.version      =  '0.1.0'
  s.source       = { :git => 'https://github.com/andrewsardone/UISegmentedControl-TitleWithImage.git', :tag => s.version }
  s.authors      = { 'Andrew Sardone' => 'andrew@andrewsardone.com' }
  s.license      = 'MIT'
  s.source_files = "Classes"
  s.platform     = :ios
end
