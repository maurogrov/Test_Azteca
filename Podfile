# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

target 'Test_Azteca' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!


  # Pods for Test_Azteca
	pod 'Charts'
	pod 'Firebase/Core'
	pod 'Firebase/Firestore'
	pod 'Firebase/Storage'
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
  end
 end
end
