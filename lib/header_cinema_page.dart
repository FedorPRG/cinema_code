import 'package:cinema2/my_profile.dart';
import 'package:flutter/material.dart';

class HeaderCinemaPage extends StatelessWidget {
  const HeaderCinemaPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 1200,
        child: Stack(
          children: [
            Image(
              width: 1200,
              image: AssetImage('images/mainScreen.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CINEMA APP',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      color: Colors.orange,
                      height: .9,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                MyProfile()
              ],
            )
          ],
        ),
      ),
    );
  }
}
