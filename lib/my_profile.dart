import 'package:cinema2/menu_my_profile.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.person,
          color: Colors.orange,
          size: 15,
        ),
        const SizedBox(
          width: 4,
        ),
        const Text(
          'USER',
          style: TextStyle(
              color: Colors.white, fontSize: 9, fontFamily: 'Roboto-Regular'),
        ),
        //Выпадающее меню
        MenuAnchor(
            builder: (context, controller, child) {
              return SizedBox(
                width: 20,
                height: 20,
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Colors.orange, size: 20),
                  //всплывающая подсказка
                  tooltip: 'Profile menu',
                ),
              );
            },
            menuChildren: const [MenuMyProfile()])
      ],
    );
  }
}
