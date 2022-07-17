import 'package:flutter/material.dart';
import 'package:flutter_shoes/kconstants.dart';
import 'package:flutter_shoes/pages/profile_page.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    // make custom bottom bar with icons search profile and home
    return SizedBox(
      height: kToolbarHeight * 1.8,
      width: kToolbarHeight * 20,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 0.0,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Animated iCON
            //three icons, home
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: kSquircle,
              ),
              child: const Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: kSquircle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.favorite_rounded,
                color: Colors.black,
              ),
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: kSquircle,
                    ),
                    child: const Icon(
                      Icons.account_circle_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );

    //   return AnimatedContainer(
    //     duration: const Duration(milliseconds: 200),
    //     decoration: kBottomBar.copyWith(color: Colors.transparent),
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           AnimatedContainer(
    //             duration: const Duration(milliseconds: 200),
    //             height: 40,
    //             width: 40,
    //             decoration: BoxDecoration(
    //               color: color,
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: const Icon(
    //               Icons.home,
    //               color: Colors.white,
    //             ),
    //           ),
    //           AnimatedContainer(
    //             duration: const Duration(milliseconds: 200),
    //             height: 40,
    //             width: 40,
    //             decoration: BoxDecoration(
    //               color: color,
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: const Icon(
    //               Icons.search,
    //               color: Colors.white,
    //             ),
    //           ),
    //           AnimatedContainer(
    //             duration: const Duration(milliseconds: 200),
    //             height: 40,
    //             width: 40,
    //             decoration: BoxDecoration(
    //               color: color,
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: const Icon(
    //               Icons.shopping_cart,
    //               color: Colors.white,
    //             ),
    //           ),
    //           AnimatedContainer(
    //             duration: const Duration(milliseconds: 200),
    //             height: 40,
    //             width: 40,
    //             decoration: BoxDecoration(
    //               color: color,
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: const Icon(
    //               Icons.person_outline,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    //
  }
}
