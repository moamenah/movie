import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/utils/dialog.dart';
import 'package:movie_app/ui/login/login_navigator.dart';
import 'package:movie_app/ui/login/login_screen_viewModel.dart';
import 'package:movie_app/ui/register_screen/custom_Text_form_field.dart';
import 'package:movie_app/ui/register_screen/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>implements LoginNavigator {


  LoginScreenViewModel viewModel=LoginScreenViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return  ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.12),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
      key: viewModel.formKey,
                child: Column(
                  children: [
                    Image.asset(AppAssets.login_movie),
                    SizedBox(height: height * 0.04),

                    CustomTextFormField(
                      prefixIcon: Image.asset(AppAssets.icon_email),
                      controller: viewModel.emailController,
                      hintText: "Email",
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: AppColors.textPrimary,
                      ),
                      prefixIcon: Image.asset(AppAssets.icon_lock1),
                      controller: viewModel.passwordController,
                      hintText: "Password",
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.forgetpassword);
                        },
                        child: Text(
                          "Forget Password ?",
                          style: AppStyles.regular16White.copyWith(
                            color: AppColors.primary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    CustomElevatedButton(onPressed: () {

      viewModel.logIn();
    //  Navigator.of(context).pushReplacementNamed(AppRoutes.hoome);

                    }, text: "Login"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t Have Account ?", style: AppStyles.regular16White),
                        // SizedBox(height: height*0.01,),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.register);
                          },
                          child: Text(
                            "Create One",
                            style: AppStyles.regular16White.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.primary,
                            thickness: 1,
                            indent: width*0.10,
                            endIndent: width*0.04,
                          ),
                        ),
                        Text(
                          "OR",
                          style: AppStyles.regular14White.copyWith(
                            fontSize: 15,
                            color: AppColors.primary,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.primary,
                            thickness: 1,
                            indent: width*0.04,
                            endIndent: width*0.10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    CustomElevatedButton(
                      iconWidget: Image.asset(AppAssets.icon_google),
                      onPressed: () {




                      },
                      text: "Login With Google ",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideMyLoading() {
    // TODO: implement hideMyLoading
    DialogUtils.hideLoading(context: context);
  }

  @override
  void showMyLoading(String message) {
    // TODO: implement showMyLoading
    DialogUtils.showLoading(context: context, text: message);
  }

  @override
  void showMyMsg({
    required String message,
    String? postActionName,
    VoidCallback? postAction,
    String? navActionName,
    VoidCallback? navAction,
  }) {
    DialogUtils.showMsg(
      context: context,
      text: message,
      postActionName: postActionName,
      postAction: postAction,
      navActionName: navActionName,
      navAction: navAction,
    );
  }

  @override
  void navigateToHome() {
    // TODO: implement navigateToHome
    Navigator.of(context).pushReplacementNamed(AppRoutes.home_screen);

  }
}
