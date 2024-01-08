import 'package:cinema2/inherited.dart';
import 'package:flutter/material.dart';

class ItemMenuCart extends StatelessWidget {
  const ItemMenuCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Для отображения количества билетов в корзине
    final itemsInCart = Inherited.watch(context)?.listTicketsInCart ?? [];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 16,
            ),
            Positioned(
              //индикатор билетов в корзине
              top: -9,
              right: -5,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: itemsInCart.isNotEmpty
                        ? Colors.blue
                        : Colors.transparent),
                child: Text(
                  '${itemsInCart.length}',
                  style: const TextStyle(
                      height: 1.5, color: Colors.white, fontSize: 9),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        const Text('Cart', style: TextStyle(color: Colors.black))
      ],
    );
  }
}
