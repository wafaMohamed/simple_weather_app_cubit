import 'package:flutter/material.dart';

class CustomDefaultWidget extends StatelessWidget {
  const CustomDefaultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather 😔 ',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'start searching now 🔍',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
