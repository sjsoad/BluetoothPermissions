Pod::Spec.new do |s|

# 1
s.platform = :ios
s.swift_version = '4.0'
s.ios.deployment_target = '10.0'
s.name = "SKBluetoothPermissions"
s.summary = "SKBluetoothPermissions allows you to check Bluetooth permissions"
s.requires_arc = true

# 2
s.version = "0.0.3"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Serhii Kostian" => "skostyan666@gmail.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/sjsoad/BluetoothPermissions"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/sjsoad/BluetoothPermissions.git", :tag => "#{s.version}"}

# 7
s.framework = "CoreBluetooth"

# 8
s.source_files = "BluetoothPermissions/**/*.{swift}"

#10
s.dependency 'SKServicePermissions'

end
