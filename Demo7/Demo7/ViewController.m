//
//  ViewController.m
//  Demo7
//
//  Created by vfa on 8/17/22.
//

#import "ViewController.h"
NSString *const kEmailTextFieldHorizontal = @"H:|-[_textFieldEmail]-|";
NSString *const kEmailTextFieldVertical = @"V:|-[_textFieldEmail]";
NSString *const kEmailConfirmTextFieldHorizontal = @"H:|-[_textFieldConfirmEmail]-|";
NSString *const kEmailConfirmTextFieldVertical = @"V:[_textFieldEmail]-[_textFieldConfirmEmail]";
NSString *const kRegisterVertical =@"V:[_textFieldConfirmEmail]-[_registerBtn]";
@interface ViewController ()
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UIButton *registerBtn;
@property (nonatomic,strong) UITextField * textFieldEmail;
@property (nonatomic,strong) UITextField * textFieldConfirmEmail;
@property (nonatomic,strong) UIView *topGrayView;
@property (nonatomic,strong) UIView *bottomGrayView;
@property (nonatomic,strong) UIButton *topButton;
@property (nonatomic,strong) UIButton *bottomButton;
@end

@implementation ViewController
-(UITextField *) textFieldWithPlaceHolder:(NSString *) paramPlaceHolder{
    
    UITextField *result = [[UITextField alloc] init];
    result.translatesAutoresizingMaskIntoConstraints = NO;
    result.borderStyle = UITextBorderStyleRoundedRect;
    result.placeholder = paramPlaceHolder;
    return result;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button setTitle:@"Button" forState:UIControlStateNormal];
    
    [self.view addSubview:self.button];
    
    UIView *superView = self.button.superview;
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
    
    [superView addConstraints:@[centerXConstraint,centerYConstraint]];
    
    self.textFieldEmail = [self textFieldWithPlaceHolder:@"Email"];
    self.textFieldConfirmEmail = [self textFieldWithPlaceHolder:@"Confirm Email"];
    
    self.registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.registerBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.registerBtn setTitle:@"Register" forState:UIControlStateNormal];
    
    [self.view addSubview:self.textFieldEmail];
    [self.view addSubview:self.textFieldConfirmEmail];
    [self.view addSubview:self.registerBtn];
    
    [self.view addConstraints:[self constraints]];
    
    [self createGrayView];
    [self createButtons];
    [self applyConstraintTopGrayView];
    [self applyConstraintBottomGrayView];
   
    [self applyConstraintToButtonOnTopGrayView];
    [self applyConstraintToButtonOnBottomGrayView];
    
    
}

-(NSArray *) emailTextFieldConstraint{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSDictionary *viewDic = NSDictionaryOfVariableBindings(_textFieldEmail);
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kEmailTextFieldHorizontal options:0 metrics:nil views:viewDic]];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kEmailTextFieldVertical options:0 metrics:nil views:viewDic]];
    return  [NSArray arrayWithArray:result];
}

-(NSArray *) emailConfirmTextFieldConstraint{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSDictionary *viewDic = NSDictionaryOfVariableBindings(_textFieldConfirmEmail,_textFieldEmail);
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kEmailConfirmTextFieldHorizontal options:0 metrics:nil views:viewDic]];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kEmailConfirmTextFieldVertical options:0 metrics:nil views:viewDic]];
    return  [NSArray arrayWithArray:result];
}
-(NSArray *) registerBtnConstraint{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSDictionary *viewDic = NSDictionaryOfVariableBindings(_registerBtn,_textFieldConfirmEmail);
    
    [result addObject:[NSLayoutConstraint constraintWithItem:self.registerBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kRegisterVertical options:0 metrics:nil views:viewDic]];
    return  [NSArray arrayWithArray:result];
}

-(NSArray *) constraints{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    [result addObjectsFromArray:[self emailTextFieldConstraint]];
    [result addObjectsFromArray:[self emailConfirmTextFieldConstraint]];
    [result addObjectsFromArray:[self registerBtnConstraint]];
    return  [NSArray arrayWithArray:result];
}

-(UIView *) newGrayView{
    
    UIView *result = [[UIView alloc] init];
    result.backgroundColor = UIColor.grayColor;
    result.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:result];
    return  result;
}

-(void) createGrayView{

    self.topGrayView = [self newGrayView];
    self.bottomGrayView = [self newGrayView];
    
}

-(UIButton *) newButtonPlaceOnView:(UIView *)paramView{
    UIButton *result = [UIButton buttonWithType:UIButtonTypeSystem];
    result.translatesAutoresizingMaskIntoConstraints=NO;
    [result setTitle:@"Button" forState:UIControlStateNormal];
    [paramView addSubview:result];
    return result;
}
-(void) createButtons{
    self.topButton = [self newButtonPlaceOnView:self.topGrayView];
    self.bottomButton = [self newButtonPlaceOnView:self.bottomGrayView];
    
}

-(void) applyConstraintTopGrayView{
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_topGrayView,_button);
    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_topGrayView]-|" options:0 metrics:nil views:views]];
    
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_button]-[_topGrayView]" options:0 metrics:nil views:views]];
    
    [self.topGrayView.superview addConstraints:constraints];
}
-(void) applyConstraintBottomGrayView{
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_topGrayView,_bottomGrayView);
    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_bottomGrayView]-|" options:0 metrics:nil views:views]];
    
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_topGrayView(==100)]-[_bottomGrayView(==100)]" options:0 metrics:nil views:views]];
    
    [self.bottomGrayView.superview addConstraints:constraints];
}

-(void) applyConstraintToButtonOnTopGrayView{
    NSDictionary *views = NSDictionaryOfVariableBindings(_topButton);
    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_topButton]" options:0 metrics:nil views:views]];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.topButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.topGrayView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    
    [self.topButton.superview addConstraints:constraints];
}
-(void) applyConstraintToButtonOnBottomGrayView{
    NSDictionary *views = NSDictionaryOfVariableBindings(_topButton,_bottomButton);
    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    [self.bottomGrayView.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_topButton][_bottomButton]" options:0 metrics:nil views:views]];
    
    [self.bottomButton.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.bottomGrayView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;}
@end
