import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/ui/register_screen/custom_Text_form_field.dart';
import 'package:movie_app/ui/register_screen/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.12),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Image.asset(AppAssets.login_movie),
                SizedBox(height: height * 0.04),

                CustomTextFormField(
                  prefixIcon: Image.asset(AppAssets.icon_email),
                  controller: emailController,
                  hintText: "Email",
                ),
                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: AppColors.textPrimary,
                  ),
                  prefixIcon: Image.asset(AppAssets.icon_lock1),
                  controller: passwordController,
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
                CustomElevatedButton(onPressed: () {}, text: "Login"),
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
                  onPressed: () {},
                  text: "Login With Google ",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
