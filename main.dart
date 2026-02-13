import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/categoris_page.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/product_details_page.dart';
import 'package:flutter_application_1/pages/products_page.dart' show ProductsPage;
import 'package:flutter_application_1/pages/sign_up_page.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main(){

runApp(loginApp());
}

class loginApp extends StatelessWidget {
  const loginApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return MaterialApp(
      locale: Locale('ar'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'),
        Locale('en')
      ],

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed( 
          seedColor: Colors.orange
          ).copyWith(
            primary: Colors.orange,
            onPrimary: Colors.white,
            secondary: Colors.black,
            onSecondary: Colors.white,
          ),

      ),
      debugShowCheckedModeBanner: false,
      home: loginpage(),
    );
  }
  
}

