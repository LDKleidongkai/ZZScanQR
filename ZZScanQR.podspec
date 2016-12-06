Pod::Spec.new do |s|
  s.name = 'ZZScanQR’
  s.version = ‘0.0.1’

  s.license = 'MIT'
  s.summary = 'QR Code Scanner/Generator'
  s.homepage = 'https://github.com/xiaozao2008/ZZScanQR'
  s.author = { 'xiaozao’ => ‘xiaozao@xiaozao2008.com’ }
  s.source = { :git => 'https://github.com/xiaozao2008/ZZScanQR.git', :tag => 0.0.1 }
  s.platform = iOS,’8.0’
  s.source_files = “ZZScanQR/ZZScanQR/*”
  s.description = 'QR Code Scanner/Generator || 二维码生成与识别’
  s.requires_arc = true
  s.framework = 'AVFoundation'
  
 
end