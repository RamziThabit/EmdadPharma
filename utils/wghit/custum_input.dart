
import 'package:flutter/material.dart';

class CustumInput extends StatelessWidget {
  const CustumInput({
    super.key,
    required this.lable,
    required this.prefix,
    this.sufix,
    this.obscure=false,
    required this.controller,
    required this.validator
    
  });
  final String lable;
  final IconData prefix;
  final Widget? sufix;
  final bool obscure;
  final String? Function(String?) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.black),
          
                
        ), 
        prefixIcon: Icon(prefix ,color: Theme.of(context).colorScheme.primary),
        suffixIcon: sufix,
        //Icon(Icons.visibility_off_outlined, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}

