platform :ios, '8.0'

target 'Drivecast' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  inhibit_all_warnings!
  use_frameworks!

  # Pods for Drivecast
  pod 'RealmSwift',                 '~> 1.1'
  pod 'SwiftyJSON',                 '~> 2.4'
  pod 'Alamofire',                  '~> 3.5'
  pod 'ReactiveCocoa',              '~> 4.2.2'
  pod 'SpinKit',                    '~> 1.2'
  pod 'SnapKit',                    '0.22.0'
  pod 'AngleGradientLayer',         '~> 1.2.3'
  pod 'IQKeyboardManagerSwift',     '4.0.5'
  pod 'BEMSimpleLineGraph',         '~> 4.1'
  pod 'KVNProgress',                '>= 2.3.1'
  pod 'DeviceKit',                  '0.3.4'
  pod 'Fabric',                     '>= 1.6.9'
  pod 'Crashlytics',                '>= 3.8.2'

  target 'DrivecastTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DrivecastUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '2.3'
        end
    end
end

