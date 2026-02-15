import 'package:flutter/material.dart';
import 'package:flutter_application_1/navpar.dart';
import 'package:flutter_application_1/pages/categoris_page.dart';
import 'package:flutter_application_1/pages/sign_up_page.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart' show getProportionalWidth;
import 'package:flutter_application_1/utils/wghit/custum_input.dart';
import 'package:flutter_application_1/utils/wghit/top_wave_painter.dart';
import 'package:flutter_application_1/utils/wghit/bottom_wave_painter.dart';
import 'package:flutter_application_1/utils/valdite_login.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

bool isNotvVisable = true;
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _loginpageState extends State<loginpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          // موجة أعلى
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 220),
              painter: TopWavePainter(),
            ),
          ),

          // موجة أسفل
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 200),
              painter: BottomWavePainter(),
            ),
          ),

          // المحتوى
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: getProportionalWidth(320),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        const SizedBox(height: 60),

                        const Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2563EB),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // البريد الإلكتروني
                        CustumInput(
                          keboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          lable: 'Email',
                          prefix: Icons.email_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }
                            if (!RegExp(emailRegex).hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // كلمة المرور
                        CustumInput(
                          keboardType: TextInputType.visiblePassword,
                          obscure: isNotvVisable,
                          controller: _passwordController,
                          lable: 'Password',
                          prefix: Icons.lock_outline,
                          sufix: IconButton(
                            onPressed: () {
                              setState(() {
                                isNotvVisable = !isNotvVisable;
                              });
                            },
                            icon: Icon(
                              isNotvVisable
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            }
                            if (value.length < 8) {
                              return "Password must be at least 8 characters";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 15),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot your password?",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // زر تسجيل الدخول مع تحقق
                        SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffF59E0B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  MainLayout(),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don’t have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  SignUpPage(),
                                  ),
                                );
                              },
                              child: const Text("Sign up"),
                            ),
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
    );
  }
}
