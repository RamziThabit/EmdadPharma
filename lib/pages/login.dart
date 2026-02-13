import 'package:flutter/material.dart';
import 'package:flutter_application_1/navpar.dart';
import 'package:flutter_application_1/pages/categoris_page.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart' show getProportionalWidth;
import 'package:flutter_application_1/utils/valdite_login.dart';
import 'package:flutter_application_1/utils/wghit/custum_input.dart';
import '../utils/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/pages/sign_up_page.dart';


class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}
 bool isNotvVisable=true;
 final _emailController= TextEditingController();
 final _passwordController= TextEditingController();
final _formKey=GlobalKey<FormState>();

class _loginpageState extends State<loginpage> {
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SafeArea(
            child: Stack(
              children: [
                // الخلفية المتدرجة
                Container(
                  decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Theme.of(context).colorScheme.primary,  Theme.of(context).colorScheme.onPrimary],
                    ),
                  ),
                ),
            
                // المحتوى 
                Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      width: getProportionalWidth(300),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                 // backgroundColor: Colors.orange,
                                 backgroundColor: Theme.of(context).colorScheme.primary,
                                  child: const Icon(Icons.lock, color: Colors.white),
                                ),
                                        
                                const SizedBox(height: 12),
                                        
                                 Text(
                                  "مرحباً بعودتك",
                                  style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                     //color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                        
                                const SizedBox(height: 6),
                                        
                                const Text(
                                  "سجل الدخول باستخدام البريد الالكتروني وكلمة المرور",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 17),
                                ),
                                        
                                const SizedBox(height: 20),
                                        
                               CustumInput(
                                keboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                lable:' البريد الالكتروني',
                               prefix: Icons.email_outlined,
                                   validator: (value){
                                    if(value!.isEmpty){
                                      return "رجاء قم باملاء الحقل";
                                    }
                                    if(!RegExp(emailRegex).hasMatch(value)){
                                      return "ادخل بريد الكتروني صالح";
                                    }
                                  return null;
                                },
                               //Icon(Icons.lock_outline_rounded ,color: Theme.of(context).colorScheme.primary)
                                ), //البريد الالكتروني
                                        
                                const SizedBox(height: 15),
                                        
                                CustumInput(
                                  keboardType: TextInputType.visiblePassword,
                                  obscure: isNotvVisable,
                                  controller: _passwordController,
                                  lable:'كلمة المرور',
                                prefix: Icons.lock_outline_rounded,
                                sufix: IconButton(onPressed: (){
                                  setState(() {
                                    isNotvVisable= ! isNotvVisable;
                                  });
                                },
                            
                                icon: Icon(isNotvVisable? Icons.visibility_off_outlined :Icons.visibility_outlined, color: Theme.of(context).colorScheme.primary),
                                
                                ),
                                validator: (value){
                                     if(value!.isEmpty){
                                      return "رجاء قم باملاء الحقل";
                                    }
                                     if(value.length<8){
                                      return "قم بادخال 8 حروف على الاقل";
                                    }
                                  return null;
                                },
                                ),//كلمة المرور
                                        
                                const SizedBox(height: 20),
                                        
                                CustomButton(
                                  title: "تسجيل الدخول",
                                  onPreeesd: () {
                                    if(_formKey.currentState!.validate()){
                                      Navigator.push(context, MaterialPageRoute(
                                    builder:(context)=> MainLayout()
                                    ));
                                    }
                                  
                                  },
                                  ),

                                     
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  
                                    TextButton(
                                      onPressed: () {  Navigator.push(context, MaterialPageRoute(
                                    builder:(context)=>SignUpPage(),),);},
                                      child: const Text("انشئ حساب",
                                    
                                      ),
                                    ),
                                      const Text("اذا كنت لا تملك حساب "),
                                  ],
                                ),
                                 const SizedBox(height: 20),
                                 IconButton(onPressed: (){},
                                icon: SvgPicture.asset(
                                  "assets/svgs/google.svg" ,
                                  width: getProportionalWidth(30),
                                  height: getProportionalWidth(30) ,
                                  
                                  )) ,                          
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
 
  }
}
