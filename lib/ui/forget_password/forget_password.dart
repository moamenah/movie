import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/ui/register_screen/custom_Text_form_field.dart';
import 'package:movie_app/ui/register_screen/custom_elevated_button.dart';

class ForgetPassword extends StatelessWidget {
  final emailController = TextEditingController();

   ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        } , icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
        child: Column(
          children: [
            Image.asset(AppAssets.forget_pas_image),
            SizedBox(height: height*0.02,),
            CustomTextFormField(
                prefixIcon: Image.asset(AppAssets.icon_email),
                controller: emailController, hintText: "Email"),
            SizedBox(height: height*0.02,),
        CustomElevatedButton(onPressed: (){
        }, text:"Verify Email")
          ],
        ),
      ),
    );
  }
}
