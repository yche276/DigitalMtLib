//
//  MZProfilePhotoView.m
//  MtZendoLib
//
//  Created by Victor Chen on 4/28/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "MZProfilePhotoView.h"

@implementation MZProfilePhotoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setProfilePhoto:(UIImage *)prmImage{
    UIImage *finalImage = nil;
    UIGraphicsBeginImageContext(prmImage.size);
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGAffineTransform trnsfrm = CGAffineTransformConcat(CGAffineTransformIdentity, CGAffineTransformMakeScale(1.0, -1.0));
        trnsfrm = CGAffineTransformConcat(trnsfrm, CGAffineTransformMakeTranslation(0.0, prmImage.size.height));
        CGContextConcatCTM(ctx, trnsfrm);
        CGContextBeginPath(ctx);
        CGContextAddEllipseInRect(ctx, CGRectMake(0.0, 0.0, prmImage.size.width, prmImage.size.height));
        CGContextClip(ctx);
        CGContextDrawImage(ctx, CGRectMake(0.0, 0.0, prmImage.size.width, prmImage.size.height), prmImage.CGImage);
        finalImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    self.image = finalImage;
}
@end
