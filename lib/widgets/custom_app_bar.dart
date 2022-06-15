import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight * 1.8,
      width: kToolbarHeight * 20,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/nike_w.png'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageShoes()),
                );
                print('NIKE');
              },
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    print('Menu tap');
                  },
                ),
                IconButton(
                  onPressed: () {
                    print('Bag tap');
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
