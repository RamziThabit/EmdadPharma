import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
import 'package:flutter_application_1/utils/custom_button.dart';
import 'package:flutter_application_1/utils/wghit/custum_input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                      colors: [Theme.of(context).colorScheme.primary, Colors.white],
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
            
                               SizedBox(height: getProportionalHeight(20),),
            
                               Text(
                                "مرحباً بك",
                                style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20,
                                   //color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
            
                              const SizedBox(height: 6),
            
                              const Text(
                                "قم بانشاء حساب وتسجيل الدخول",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
            
                              const SizedBox(height: 20),
            
                             CustumInput(
                              lable:' البريد الالكتروني',
                             prefix: Icons.email_outlined,
                             //Icon(Icons.lock_outline_rounded ,color: Theme.of(context).colorScheme.primary)
                              ), //البريد الالكتروني
            
                             SizedBox(height: getProportionalHeight(20),),
            
                              CustumInput(
                                obscure: true,
                                lable:'كلمة المرور',
                              prefix: Icons.lock_outline_rounded,
                              sufix: IconButton(onPressed: (){},
                              icon: Icon(Icons.visibility_off_outlined, color: Theme.of(context).colorScheme.primary),
                              
                              ),
                              ),//كلمة المرور
                               SizedBox(height: getProportionalHeight(20),),
            
                              CustumInput(
                                obscure: true,
                                lable:'تاكيد كلمة المرور',
                              prefix: Icons.lock_outline_rounded,
                              sufix: IconButton(onPressed: (){},
                              icon: Icon(Icons.visibility_off_outlined, color: Theme.of(context).colorScheme.primary),
                              
                              ),
                              ),
            
                            SizedBox(height: getProportionalHeight(20),),
            
                              CustomButton(
                              title: "تسجيل ",
                              onPreeesd: () {
                                
                              },
                              ),
            
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(" سجل دخول"),
                                  ),
                                    const Text("اذا كنت تملك يالفعل "),
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