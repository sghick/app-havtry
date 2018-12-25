
# 指定公共的 Specs
source 'https://github.com/CocoaPods/Specs.git'

target "HavtryDemo" do
    platform:ios, '8.0'
    use_frameworks!

    # cmp-library
    pod 'SMRJSBridge', :git => 'git@github.com:sghick/cmp-library-SMRJSBridge.git', :commit => 'e2f6eb2'
    pod 'SMRLifecycle', :git => 'git@github.com:sghick/cmp-library-SMRLifecycle.git', :commit => '4dd23fa'
    pod 'SMRModel', :git => 'git@github.com:sghick/cmp-library-SMRModel.git', :commit => 'db90262'
    pod 'SMRRanker', :git => 'git@github.com:sghick/cmp-library-SMRRanker.git', :commit => '3033794'
    pod 'SMRStabilizeGuider', :git => 'git@github.com:sghick/cmp-library-SMRStabilizeGuider.git', :commit => '0ce225f'
    
    # cmp-framework
    pod 'SMRDebug', :git => 'git@github.com:sghick/cmp-framework-SMRDebug.git', :commit => 'a8e2beb'
#    pod 'SMRLogSystem', :git => 'git@github.com:sghick/cmp-framework-SMRLogSystem.git', :commit => 'b545d78'
#    pod 'SMRLogScreen', :git => 'git@github.com:sghick/cmp-framework-SMRLogScreen.git', :commit => '22aca3a'
    pod 'SMRRouter', :git => 'git@github.com:sghick/cmp-framework-SMRRouter.git', :commit => '12a5f0a'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO' if config.build_settings['SDKROOT'] == 'iphoneos'
        end
    end
end
