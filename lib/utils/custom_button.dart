
import 'package:flutter/material.dart';
 class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPreeesd, 
     this.icon
  });

final String title;
final Widget? icon;
final VoidCallback onPreeesd;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
        //  backgroundColor: Colors.orange,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPreeesd,
        label:  Text(title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold
        ),
        ),
        icon: icon,
      ),
    );
  }
}

