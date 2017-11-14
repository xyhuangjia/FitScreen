#
# Be sure to run `pod lib lint FitScreenKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FitScreenKit'
  s.version          = '0.0.6'
  s.summary          = '一个屏幕缩放的适配方案'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
一个屏幕缩放的适配方案(适配iPhone X)
                       DESC

  s.homepage         = 'https://github.com/xyhuangjia/FitScreenKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '黄佳' => 'xyhuangjia@foxmail.com' }
  s.source           = { :git => 'https://github.com/xyhuangjia/FitScreenKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FitScreenKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FitScreenKit' => ['FitScreenKit/Assets/*.png']
  # }

  s.public_header_files = 'FitScreenKit/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
