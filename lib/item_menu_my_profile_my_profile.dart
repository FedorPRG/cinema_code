import 'package:flutter/material.dart';

class ItemMenuMyProfileMyProfile extends StatelessWidget {
  const ItemMenuMyProfileMyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.person,
          color: Colors.black,
          size: 16,
        ),
        SizedBox(width: 20),
        Text(
          'My profile',
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
