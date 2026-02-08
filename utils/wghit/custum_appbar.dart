import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
  AppBar custumAppbar(BuildContext context, String title ) {
    return AppBar(
      leading: Navigator.canPop(context) ? IconButton(onPressed: (){
      Navigator.pop(context);
      },
      icon: Icon (Icons.arrow_back_ios_new, color: Colors.white,),):null,
      backgroundColor: Colors.transparent,
      title: Text(title,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      )
      ),
      centerTitle: true,
      toolbarHeight: getProportionalHeight(130),
      shadowColor: Colors.black,
      elevation: 9,

    flexibleSpace: Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20) ),  
        gradient: LinearGradient(
          begin: AlignmentGeometry.centerLeft,
          end: Alignment.centerRight,
          colors: [ Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary]
        ),
      ),
    ) ,
    );
  }