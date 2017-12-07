#
# Be sure to run `pod lib lint MGDeeplinkNavigator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MGDeeplinkNavigator'
  s.version          = '0.0.4'
  s.summary          = 'MGDeeplinkNavigator 升级Swift 4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/mgzf/MGDeeplinkNavigator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'spf' => 'spf_ios@163.com' }
  s.source           = { :git => 'https://github.com/mgzf/MGDeeplinkNavigator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.default_subspec = 'DeeplinkNavigator'

  s.subspec 'DeeplinkNavigator' do |extension|
    extension.source_files = 'MGDeeplinkNavigator/Classes/MGDeeplinkNavigator/*.{swift,m,h}'
  end

  s.subspec 'MGDeeplinkNavigator_Extension' do |extension|
    extension.source_files = 'MGDeeplinkNavigator/Classes/Extension/*.{swift,m,h}'
    extension.dependency 'MGDeeplinkNavigator/DeeplinkNavigator'
  end
  
  # s.resource_bundles = {
  #   'MGDeeplinkNavigator' => ['MGDeeplinkNavigator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
