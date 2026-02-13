import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/display.dart';

class TreatmentCard extends StatelessWidget {
  final Treatment treatment;

  const TreatmentCard({super.key, required this.treatment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            treatment.image,
            height: 120,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 8),
          Text(treatment.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${treatment.oldPrice}',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${treatment.newPrice}',
                style: const TextStyle(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
