import 'package:cinema2/item_menu_cart.dart';
import 'package:cinema2/item_menu_my_profile_cart.dart';
import 'package:cinema2/item_menu_my_profile_logout.dart';
import 'package:cinema2/item_menu_my_profile_my_profile.dart';
import 'package:flutter/material.dart';

class MenuMyProfile extends StatelessWidget {
  const MenuMyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      width: 130,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemMenuMyProfileMyProfile(),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ItemMenuMyProfileCart();
                    });
              },
              child: const ItemMenuCart(),
            ),
            const ItemMenuMyProfileLogout()
          ],
        ),
      ),
    );
  }
}
