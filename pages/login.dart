import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/categoris_page.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart' show getProportionalWidth;
import 'package:flutter_application_1/utils/wghit/custum_input.dart';
import '../utils/custom_button.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}
 bool isNotvVisable=true;
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
                              lable:' البريد الالكتروني',
                             prefix: Icons.email_outlined,
                             //Icon(Icons.lock_outline_rounded ,color: Theme.of(context).colorScheme.primary)
                              ), //البريد الالكتروني
            
                              const SizedBox(height: 15),
            
                              CustumInput(
                                obscure: isNotvVisable,
                                lable:'كلمة المرور',
                              prefix: Icons.lock_outline_rounded,
                              sufix: IconButton(onPressed: (){
                                setState(() {
                                  isNotvVisable= ! isNotvVisable;
                                });
                              },

                              icon: Icon(isNotvVisable? Icons.visibility_off_outlined :Icons.visibility_outlined, color: Theme.of(context).colorScheme.primary),
                              
                              ),
                              ),//كلمة المرور
            
                              const SizedBox(height: 20),
            
                              CustomButton(
                                title: "تسجيل الدخول",
                                onPreeesd: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder:(context)=> CategorisPage()
                                  ));
                                },
                                ),
            
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("انشئ حساب"),
                                  ),
                                    const Text("اذا كنت لا تملك حساب "),
                                ],
                              ),                         
                            ],
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
