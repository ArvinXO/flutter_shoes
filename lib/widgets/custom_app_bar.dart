import 'package:flutter/material.dart';
import 'package:flutter_shoes/kconstants.dart';

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
            //Animated iCON
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: const BoxDecoration(
                borderRadius: kSquircle,
              ),
              child: IconButton(
                icon: Image.asset(
                  'assets/nikee.png',
                  height: 290,
                  width: 290,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePageShoes()),
                  );
                  print('NIKE');
                },
              ),
            ),

            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: kCircleBox,
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                //Add shopping cart functionality
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: kSquircle,
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
