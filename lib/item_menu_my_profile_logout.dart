import 'package:flutter/material.dart';

class ItemMenuMyProfileLogout extends StatelessWidget {
  const ItemMenuMyProfileLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.input,
          color: Colors.black,
          size: 16,
        ),
        SizedBox(width: 20),
        Text('Logout', style: TextStyle(color: Colors.black))
      ],
    );
  }
}
