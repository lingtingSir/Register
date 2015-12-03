//
//  RegisterViewController.m
//  Register
//
//  Created by lmj on 15-10-4.
//
//

#import "RegisterViewController.h"
#import "Common.h"
#import "NavigationController.h"
#import "Utils.h"
#import "LoginViewController.h"

@interface RegisterViewController ()


@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NavigationController *navBar;

@end
@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
//    [self createNavigation];
    [self createNavigation];
    [self createTableview];
    
}

/**
 *	@brief	创建自定义导航条
 */
- (void)createNavigation
{
    _navBar = [[NavigationController alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f,64.f)
                                      bgImageName:@"backgroundNavbar_ios7"
                                       labelTitle:@"注册"
                                         labFrame:CGRectMake(90.f,22.f, 140.f, 30.f)
                                         leftBool:YES
                                     leftBtnFrame:CGRectMake(12.f,15.f, 54, 44)
                                 leftBtnImageName:@"icon_back_w.png"
                                        rightBool:NO
                                    rightBtnFrame:CGRectZero
                                rightBtnImageName:nil];
    _navBar.delegate = self;

    [self.view addSubview:_navBar];
    
}

- (void)createTableview
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.f, (FSystenVersion >= 7.0)?64.f:44.f, 320.f, (FSystenVersion >=7.0)?(ISIPHONE5?(568.f - 64.f):(480.f - 64.f)):(ISIPHONE5?(548.f - 44.f):(460.f - 44.f))) style:UITableViewStyleGrouped];
    _tableView.allowsSelection = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setBackgroundColor:[Common translateHexStringToColor:@"#f0f0f0"]];
    [self.view addSubview:_tableView];
//    self.tableView=({
//        UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.tableViewHeith) style:UITableViewStylePlain];
//        tableView.delegate=self;
//        tableView.dataSource=self;
//        tableView.allowsSelection = NO;
//        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//        [tableView setBackgroundColor:[Common translateHexStringToColor:@"#f0f0f0"]];
//        [self.view addSubview:tableView];
//        tableView;
//    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        
        return 2;
    }else{
        
        return 1;
    }
}

#pragma mark - TopNavBarDelegate Method
/**
 *	@brief	TopNavBarDelegate Method
 *
 *	@param 	index 	barItemButton 的索引值
 */
- (void)itemButtonClicked:(int)index
{
    
    switch (index) {
        case 0:
        {
            LoginViewController *login =[[LoginViewController alloc] init];
            
           
            [self presentViewController:login animated:YES completion:nil];
        }
            break;
        case 1:
        {
            
        }
            break;
            
        default:
            break;
    }
}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 12;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0)
    {
        cell.imageView.image = [UIImage imageNamed:@"register_user"];
        UITextField *textField= [[UITextField alloc] initWithFrame:CGRectMake(50.f, 12.f, 220.f, 21.f)];
        textField.tag = Tag_AccountTextField;
        textField.returnKeyType = UIReturnKeyDone;
        textField.delegate = self;
        textField.placeholder = @"用户,必填";
        textField.keyboardType = UIKeyboardTypeEmailAddress;
        [cell addSubview:textField];
//        cell.textLabel.text = [NSString stringWithFormat:@"消息测试数据----%d", indexPath.row];
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0){
            cell.imageView.image = [UIImage imageNamed:@"register_password"];
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50.f, 12.f, 220.f, 21.f)];
            textField.tag = Tag_TempPasswordTextField;
            textField.returnKeyType = UIReturnKeyDone;
            textField.secureTextEntry = YES;
            textField.delegate = self;
            textField.placeholder = @"密码,必填";
            [cell addSubview:textField];
          
        }
        else if (indexPath.row == 1){
            
            cell.imageView.image = [UIImage imageNamed:@"register_password"];
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50.f, 12.f, 220.f, 21.f)];
            textField.tag = Tag_ConfirmPasswordTextField;
            textField.returnKeyType = UIReturnKeyDone;
            textField.secureTextEntry = YES;
            textField.delegate = self;
            textField.placeholder = @"确认密码,必填";
            [cell addSubview:textField];
            
        }

    }
    else if (indexPath.section == 2){
        UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        registerBtn.frame = CGRectMake(([Common IOSVersion] >= 7.0)?0.f:10.f, 0.f, ([Common IOSVersion]>=7.0)?320.f:300.f, 44.f);
        [registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [registerBtn setBackgroundImage:[UIImage imageNamed:@"register_btn"] forState:UIControlStateNormal];
        [registerBtn setTitle:@"提交" forState:UIControlStateNormal];
        [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        registerBtn.titleLabel.font = [UIFont systemFontOfSize:18.f];
        [registerBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        
        [cell addSubview:registerBtn];
    }
    //cell.textLabel.text = [NSString stringWithFormat:@"消息测试数据----%d", indexPath.row];
    return cell;
}



#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        
        return nil;
    }else if (section == 1){
        
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, 21.f)];
        footerView.backgroundColor = [UIColor clearColor];
        UILabel *label = [Utils labelWithFrame:CGRectMake(10.f, 0.f, 300.f, 21.f) withTitle:@"注册后不可更改，6~20位字符，可包含英文、数字和“_”" titleFontSize:[UIFont systemFontOfSize:10.f] textColor:[UIColor blackColor] backgroundColor:[UIColor clearColor] alignment:NSTextAlignmentLeft];
        [footerView addSubview:label];
        
        return footerView;
    
    }
    return nil;
}


-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5.0;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 5.f;
    }else if(section == 3){
        
        return 30.f;
        
    }else{
        return 21.f;
    }
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - RegisterBtnClicked Method
- (void)registerBtnClicked:(id)sender{
   
        if ([self checkValidityTextField]) {
            
//            [Utils alertTitle:@"提示" message:@"资料填写完整可以进行注册请求" delegate:nil cancelBtn:@"确定" otherBtnName:nil];
        }
    

}
/**
 *	@brief	验证文本框是否为空
 */
#pragma mark checkValidityTextField Null
- (BOOL)checkValidityTextField
{
    
    
    if ([(UITextField *)[self.view viewWithTag:Tag_AccountTextField] text] == nil || [[(UITextField *)[self.view viewWithTag:Tag_AccountTextField] text] isEqualToString:@""]) {
        
        [Utils alertTitle:@"提示" message:@"用户名不能为空" delegate:self cancelBtn:@"取消" otherBtnName:nil];
        
        return NO;
    }
    if ([(UITextField *)[self.view viewWithTag:Tag_TempPasswordTextField] text] == nil || [[(UITextField *)[self.view viewWithTag:Tag_TempPasswordTextField] text] isEqualToString:@""]) {
        
        [Utils alertTitle:@"提示" message:@"用户密码不能为空" delegate:self cancelBtn:@"取消" otherBtnName:nil];
        
        return NO;
    }
    if ([(UITextField *)[self.view viewWithTag:Tag_ConfirmPasswordTextField] text] == nil || [[(UITextField *)[self.view viewWithTag:Tag_ConfirmPasswordTextField] text] isEqualToString:@""]) {
        
        [Utils alertTitle:@"提示" message:@"用户确认密码不能为空" delegate:self cancelBtn:@"取消" otherBtnName:nil];
        
        return NO;
    }
    
    return YES;
    
}


#pragma mark - UITextFieldDelegate Method

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case Tag_AccountTextField:
        {
            
            if ([textField text] != nil && [[textField text] length]!= 0) {
                
                if ([[textField text] length] < 6) {
                    
                    [Utils alertTitle:@"提示" message:@"用户名小于6位！" delegate:nil cancelBtn:@"取消" otherBtnName:nil];
                }
            }
        }
            break;
        case Tag_TempPasswordTextField:
        {
            
            if ([textField text] != nil && [[textField text] length]!= 0) {
                
                if ([[textField text] length] < 6) {
                    
                    [Utils alertTitle:@"提示" message:@"用户密码小于6位！" delegate:nil cancelBtn:@"取消" otherBtnName:nil];
                }
            }
        }
            break;
        case Tag_ConfirmPasswordTextField:
        {
            if ([[(UITextField *)[self.view viewWithTag:Tag_TempPasswordTextField] text] length] !=0 && ([textField text]!= nil && [[textField text] length]!= 0)) {
                
                if (![[(UITextField *)[self.view viewWithTag:Tag_TempPasswordTextField] text] isEqualToString:[textField text]]) {
                    [Utils alertTitle:@"提示" message:@"两次输入的密码不一致" delegate:nil cancelBtn:@"取消" otherBtnName:nil];
                }
            }
        }
            break;
        default:
            break;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - touchMethod
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    
    [self allEditActionsResignFirstResponder];
}

#pragma mark - PrivateMethod
- (void)allEditActionsResignFirstResponder{
    
   
    //用户名
    [[self.view viewWithTag:Tag_AccountTextField] resignFirstResponder];
    //temp密码
    [[self.view viewWithTag:Tag_TempPasswordTextField] resignFirstResponder];
    //确认密码
    [[self.view viewWithTag:Tag_ConfirmPasswordTextField] resignFirstResponder];
    
}







@end
