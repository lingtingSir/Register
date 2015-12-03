//
//  Utils.h
//  Register
//
//  Created by lmj on 15-10-4.
//
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
/***************************************************************************
 *
 * 工具类
 *
 ***************************************************************************/



+ (UILabel *)labelWithFrame:(CGRect)frame withTitle:(NSString *)title titleFontSize:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor alignment:(NSTextAlignment)textAlignment;
#pragma mark - alertView提示框
+(UIAlertView *)alertTitle:(NSString *)title message:(NSString *)msg delegate:(id)aDeleagte cancelBtn:(NSString *)cancelName otherBtnName:(NSString *)otherbuttonName;
@end
