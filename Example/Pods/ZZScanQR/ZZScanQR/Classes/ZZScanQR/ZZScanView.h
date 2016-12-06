//
//  ZZScanView.h
//  ZZScanQR
//
//  Created by Tony on 2016/12/6.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ScanResult) (NSString *resultString);
@interface ZZScanView : UIView

- (instancetype)initWithFrame:(CGRect)frame success:(ScanResult)successResult;

@end
