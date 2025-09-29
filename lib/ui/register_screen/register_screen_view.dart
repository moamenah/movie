import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/utils/dialog.dart';
import 'package:movie_app/ui/register_screen/custom_Text_form_field.dart';
import 'package:movie_app/ui/register_screen/custom_elevated_button.dart';
import 'package:movie_app/ui/register_screen/register_navigator.dart';
import 'package:movie_app/ui/register_screen/register_view_model.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> implements RegisterNavigator{

  List<String> avatars = [
    AppAssets.gamer2,
    AppAssets.gamer1,
    AppAssets.gamer0,
    AppAssets.gamer4,
    AppAssets.gamer5,
    AppAssets.gamer6,
    AppAssets.gamer7,
    AppAssets.gamer8,
  ];
  int selectedIndex = 1;

  RegisterViewModel viewModel = RegisterViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return  ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: viewModel.formKey, // ✅ هنا الkey
              child: Column(
                children: [
                  // Avatars
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(avatars.length, (index) {
                        final isSelected = index == selectedIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  scale: CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeInOut,
                                  ),
                                  child: child,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.transparent,
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  key: ValueKey(isSelected),
                                  radius: isSelected ? 60 : 30,
                                  backgroundImage: AssetImage(avatars[index]),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Name
                  CustomTextFormField(
                    controller: viewModel.nameController,
                    prefixIcon: Image.asset(AppAssets.icon_name),
                    hintText: "Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * 0.02),

                  // Email
                  CustomTextFormField(
                    controller: viewModel.emailController,
                    prefixIcon: Image.asset(AppAssets.icon_email),
                    hintText: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!value.contains("@")) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * 0.02),

                  // Password
                  CustomTextFormField(
                    controller: viewModel.passwordController,
                    prefixIcon: Image.asset(AppAssets.icon_lock1),
                    hintText: "Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility_off,
                        color: AppColors.textPrimary),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * 0.02),

                  // Confirm Password
                  CustomTextFormField(
                    controller: viewModel.confirmPasswordController,
                    prefixIcon: Image.asset(AppAssets.icon_lock1),
                    hintText: "Confirm Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility_off,
                        color: AppColors.textPrimary),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      }
                      if (value != viewModel.passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * 0.02),

                  // Phone
                  CustomTextFormField(
                    controller: viewModel.phoneController,
                    prefixIcon: Image.asset(AppAssets.icon_phone),
                    hintText: "Phone Number",
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "Phone number must be digits only";
                      }
                      if (value.length < 10) {
                        return "Phone number is too short";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * 0.02),

                  // Create Account button
                  CustomElevatedButton(
                    onPressed: () {
                      viewModel.register();

                    },
                    text: "Create Account",
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have Account?",
                          style: AppStyles.regular16White),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(AppRoutes.home_screen);

                        },
                        child: Text(
                          "Login",
                          style: AppStyles.regular16White.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
    VoidCallback? postAction,
    String? postActionName,
    VoidCallback? navAction,
    String? navActionName,
  }) {
    DialogUtils.showMsg(
      context: context,
      text: message,
      postActionName: postActionName ?? "OK", // افتراضي "OK"
      postAction: postAction,
      navActionName: navActionName,
      navAction: navAction,
    );
  }

  @override
  void navigateToHome() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.home_screen);
  }

}
