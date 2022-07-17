import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter_shoes/kconstants.dart';
import 'package:flutter_shoes/models/shoes.dart';
import 'package:flutter_shoes/widgets/custom_button.dart';
import 'package:flutter_shoes/widgets/transition.dart';

class DetailsShoesPage extends StatefulWidget {
  const DetailsShoesPage({Key? key, required this.shoes}) : super(key: key);
  final Shoes shoes;
  @override
  State<DetailsShoesPage> createState() => _DetailsShoesPageState();
}

class _DetailsShoesPageState extends State<DetailsShoesPage> {
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  int valueIndexColor = 0;
  int valueIndexSize = 1;
  bool isFavourite = false;
  int valueIndexQuantity = 1;
  String totalValue = '';

  double sizeShoes(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.08);
      case 1:
        return (size.height * 0.07);
      case 2:
        return (size.height * 0.05);
      case 3:
        return (size.height * 0.04);
      case 4:
        return (size.height * 0.03);
      case 5:
        return (size.height * 0.02);
      default:
        return (size.height * 0.02);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 12),
            onEnd: () {
              setState(() {
                index = index + 1;
                // animate the color
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];

                //// animate the alignment
                begin = alignmentList[index % alignmentList.length];
                end = alignmentList[(index + 2) % alignmentList.length];
              });
            },
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: begin, end: end, colors: [bottomColor, topColor])),
          ),
          Positioned(
            bottom: size.height * 0.5,
            right: -size.height * 0.25,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 108),
              tween: Tween(begin: 0, end: 1),
              builder: (context, value, __) {
                // hide container behind the image
                return AnimatedContainer(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  duration: const Duration(milliseconds: 400),
                  height: value * (size.height * 0.52),
                  width: value * (size.height * 0.5),
                  decoration: BoxDecoration(
                    color: widget.shoes.listImage[valueIndexColor].color
                        .withOpacity(0.89),
                    shape: BoxShape.circle,
                  ),
                  child: ArcText(
                      radius: 160,
                      text: widget.shoes.category,
                      textStyle: kSplitText.copyWith(
                        fontSize: value * (size.height * 0.045),
                        color: widget.shoes.listImage.length ==
                                widget.shoes.listImage.length
                            ? Colors.white
                            : Colors.black,
                      ),
                      startAngle: -pi / 1.7,
                      startAngleAlignment: StartAngleAlignment.start,
                      placement: Placement.outside,
                      direction: Direction.counterClockwise),
                );
              },
            ),
          ),
          Positioned(
            top: kToolbarHeight - 22,
            left: 16,
            right: 76,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CustomButton(
                //   onTap: () => {
                //     Navigator.pop(context),
                //   },
                //   child: const Icon(Icons.arrow_back_rounded),
                //   color: Colors.black,
                // ),

                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: size.height * 0.05,
                  width: size.height * 0.04,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          //Pop the page
                          Navigator.pop(context);
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back,
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: isFavourite
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: kSquircle),
                  //Make favourite icon button that will be animated and contains state
                  //create gestureDetector to detect the tap to remove the favourite
                  //mAKE ICON  CHANGE WHEN TAPPED
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: size.height * 0.05,
                    width: size.height * 0.05,
                    decoration: BoxDecoration(
                      color: isFavourite
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : const Color.fromARGB(255, 0, 0, 0),
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavourite = !isFavourite;
                          //Keep isFavourite state
                        });
                      },
                      child: Icon(
                        isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        size: size.height * 0.03,

                        // color white if not favourite and black if favourite
                        color: isFavourite
                            ? const Color.fromARGB(255, 255, 0, 0)
                            : const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Create shopping cart icon next to favourit icon
          Positioned(
            top: kToolbarHeight - 22,
            right: 16,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: size.height * 0.05,
              width: size.height * 0.05,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  // setState(() {
                  //   //Pop the page
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ShoppingCartPage(),
                  //     ),
                  //   );
                  // });
                },
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: size.height * 0.03,
                ),
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.08,
            right: 0,
            left: 10,
            child: const FittedBox(
                // child: Text(
                //   widget.shoes.category,
                //   style: kShoeCategory.copyWith(
                //     fontSize: 18,
                //   ),
                // ),
                ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: size.height * 0.08,
            right: sizeShoes(valueIndexSize, size),
            left: size.height / 30,
            child: Hero(
              tag: widget.shoes.name,
              child: Image(
                image:
                    AssetImage(widget.shoes.listImage[valueIndexColor].image),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.696,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Colour',
                        style: kShoeCategory.copyWith(
                            fontSize: 25, color: Colors.grey.shade100),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: List.generate(
                          widget.shoes.listImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              valueIndexColor = index;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 16, left: 1),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: widget.shoes.listImage[index].color,
                                  borderRadius: index == valueIndexColor
                                      ? BorderRadius.circular(35)
                                      : BorderRadius.circular(9),
                                  border: index == valueIndexColor
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null),
                            ),
                          ),
                        ),
                      ),
                      //Increment button and decrement button
                      const SizedBox(
                        height: 19,
                      ),

                      //Increment button and decrement button with counter
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.48,
            right: size.width * 0.02,
            left: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: kCircleBox,
                      ),
                      child: ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   widget.shoes.category,
                            //   style:
                            //       kShoeCategory.copyWith(color: Colors.black),
                            // ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(widget.shoes.name,
                                style: kShoeName, textAlign: TextAlign.left),
                          ],
                        ),
                      ),
                    ),
                    ShakeTransition(
                      left: true,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.transparent,
                            width: 9,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          ('£') + widget.shoes.price,
                          style: kShoeCategory.copyWith(
                              fontSize: 25, color: Colors.grey.shade100),
                        ),
                      ),
                    ),
                  ],
                ),
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.003,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(Icons.star,
                              color: widget.shoes.punctuation > index
                                  ? widget
                                      .shoes.listImage[valueIndexColor].color
                                  : Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.580,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Size",
                  style: kShoePrice.copyWith(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: indexShoeSize(),
                ),
              ],
            ),
          ),

          Positioned(
            top: size.height * 0.850,
            left: 20,
            right: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity',
                  style: kShoeCategory.copyWith(
                      fontSize: 25, color: Colors.grey.shade100),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // INDEX CAN NOT BE NEGATIVE
                      if (valueIndexQuantity > 0) {
                        valueIndexQuantity--;
                      }
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                            color:
                                widget.shoes.listImage[valueIndexColor].color,
                            width: 2)),
                    child: Icon(
                      Icons.remove,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                Text(
                  '$valueIndexQuantity',
                  style: kShoeCategory.copyWith(
                      fontSize: 20, color: Colors.grey.shade800),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      valueIndexQuantity++;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                            color:
                                widget.shoes.listImage[valueIndexColor].color,
                            width: 2)),
                    child: Icon(
                      Icons.add,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.94,
            // left: size.width * 0.33,
            child: ShakeTransition(
              left: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      // Text(
                      //   'Total:',
                      //   style: kShoeCategory.copyWith(
                      //       fontSize: 25, color: Colors.grey.shade100),
                      // ),
                    ],
                  ),
                  //column with total on the left
                  //sizedbox to make space between text and price
                  Row(
                    children: [
                      Text(
                        // if quantity is 0 then price is widget.shoes.price
                        //store price in variable price
                        valueIndexQuantity == 1
                            ? totalValue = ('£') + widget.shoes.price
                            : totalValue = ('£') +
                                (int.parse(widget.shoes.price) *
                                        valueIndexQuantity)
                                    .toString(),

                        //Calculate shoe price times quantity

                        style: kShoeCategory.copyWith(
                            fontSize: 0, color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // INDEX CAN NOT BE NEGATIVE
                        if (widget.shoes.listImage[valueIndexColor].color ==
                            Colors.black) {
                          kShoeCategory.copyWith(
                              fontSize: 25,
                              color: const Color.fromARGB(255, 0, 0, 0));
                        } else {
                          kShoeCategory.copyWith(
                              fontSize: 25, color: Colors.white);
                        }
                      });
                    },
                    //buy now button  to the right with favourit button to the left
                    // child: Column(
                    //   children: [
                    //     const SizedBox(
                    //       width: 30,
                    //     ),
                    //     //favourite button next to buy now button
                    //     Row(
                    //       children: [
                    //         GestureDetector(
                    //           onTap: () {
                    //             setState(() {
                    //               //if isFavourite is true then set isFavourite to false
                    //               if (isFavourite) {
                    //                 isFavourite = false;
                    //               } else {
                    //                 isFavourite = true;
                    //               }
                    //             });
                    //           },
                    //           child: Container(
                    //             height: 40,
                    //             width: size.width * 0.12,
                    //             decoration: BoxDecoration(
                    //                     color: widget.shoes
                    //                         .listImage[valueIndexColor].color)
                    //                 .copyWith(
                    //                     borderRadius: BorderRadius.circular(9),
                    //                     border: Border.all(
                    //                         color: Colors.grey.shade800,
                    //                         width: 2)),
                    //             child: Icon(
                    //               isFavourite
                    //                   ? Icons.favorite
                    //                   : Icons.favorite_border_rounded,
                    //               size: size.height * 0.03,

                    //               // color white if not favourite and black if favourite
                    //               color: isFavourite
                    //                   ? const Color.fromARGB(255, 255, 0, 0)
                    //                   : const Color.fromARGB(
                    //                       255, 255, 255, 255),
                    //             ),
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           width: 10,
                    //         ),
                    //         //Buy now button with text buy now
                    //         GestureDetector(
                    //           onTap: () {
                    //             setState(() {
                    //               //if isFavourite is true then set isFavourite to false
                    //               if (isFavourite) {
                    //                 isFavourite = false;
                    //               } else {
                    //                 isFavourite = true;
                    //               }
                    //             });
                    //           },
                    //           child: Container(
                    //             height: 40,
                    //             width: size.width * 0.8,
                    //             decoration: BoxDecoration(
                    //                     color: widget.shoes
                    //                         .listImage[valueIndexColor].color)
                    //                 .copyWith(
                    //                     borderRadius: BorderRadius.circular(9),
                    //                     border: Border.all(
                    //                         color: Colors.grey.shade800,
                    //                         width: 2)),
                    //             child: Center(
                    //               child: Text(
                    //                 'Buy Now',
                    //                 style: kShoeCategory.copyWith(
                    //                     fontSize: 25,
                    //                     color: Colors.grey.shade800),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: size.width * 0.99,
                          height: size.height * 0.060,
                          decoration: kBottomBar.copyWith(
                              color: widget
                                  .shoes.listImage[valueIndexColor].color),
                          child: Center(
                            child: Text(
                                style: kTabText.copyWith(
                                    fontSize: 25, color: Colors.white),
                                valueIndexQuantity == 0
                                    ? (('Select quantity'))
                                    : '$totalValue Buy now'),
                          ),
                        ),
                      ],
                    ),

                    // child: CustomButton(
                    //   width: size.width,
                    //   color: widget.shoes.listImage[valueIndexColor].color,

                    //   child:  Text(

                    //       valueIndexQuantity == 0
                    //           ? (('Select quantity'))
                    //           : '$totalValue: Buy now'),
                    //           ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ), // Stack
    );
  }

//make indexShoeSize() global so it can be used in other functions
  List<Widget> indexShoeSize() {
    List<Widget> list = [];
    for (int i = 0; i < widget.shoes.listSize.length; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            setState(() {
              valueIndexSize = i;
            });
          },
          child: Expanded(
            child: Container(
              height: 52,
              width: 52,
              margin: const EdgeInsets.only(right: 13),
              decoration: BoxDecoration(
                  color: widget.shoes.listSize[i] ==
                          widget.shoes.listSize[valueIndexSize]
                      ? widget.shoes.listImage[valueIndexColor].color
                      : Colors.grey.shade800,
                  borderRadius: i == valueIndexSize
                      ? BorderRadius.circular(35)
                      : BorderRadius.circular(9),
                  border: i == valueIndexSize
                      ? Border.all(color: Colors.white, width: 2)
                      : Border.all(
                          color: widget.shoes.listImage[valueIndexColor].color,
                          width: 2)),
              child: Center(
                child: Text(
                  widget.shoes.listSize[i].toString(),
                  style: kShoeCategory.copyWith(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  List<Widget> indexSizes() {
    return List.generate(
      6,
      (index) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CustomButton(
          onTap: () {
            valueIndexSize = index;
            setState(() {
              print(
                "Size Selected : ${index + 7}",
              );
            });
          },
          borderRadius: valueIndexSize == index ? kCircleBox : kSquircle,
          color: index == valueIndexSize
              ? widget.shoes.listImage[valueIndexColor].color
              : Colors.grey.shade800,
          child: Text(
            "${index + 7}",
            style: kShoeName == kShoeName
                ? kShoeName.copyWith(color: Colors.white)
                : kShoeName.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
