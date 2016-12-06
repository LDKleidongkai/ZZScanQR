//
//  ZZScanView.m
//  ZZScanQR
//
//  Created by Tony on 2016/12/6.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "ZZScanView.h"
#import <AVFoundation/AVFoundation.h>
@interface ZZScanView ()

@end

@implementation ZZScanView
{
    AVCaptureSession *session;
    ScanResult result;
}

- (instancetype)initWithFrame:(CGRect)frame success:(ScanResult)successResult
{
    if (self = [super initWithFrame:frame]) {
        result = successResult;
    }
    return self;
}

- (void)systemReaderQR
{
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
//    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [session addInput:input];
    [session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=self.layer.bounds;
    [self.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [session startRunning];
}
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        //[session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects firstObject];
        //输出扫描字符串
        result(metadataObject.stringValue);
        
        
    }
}





@end
