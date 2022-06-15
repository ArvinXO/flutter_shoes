import 'package:flutter/material.dart';
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
            right: -size.height * 0.20,
            child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 108),
                tween: Tween(begin: 0, end: 1),
                builder: (context, value, __) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: value * (size.height * 0.5),
                    width: value * (size.height * 0.5),
                    decoration: BoxDecoration(
                      color: widget.shoes.listImage[valueIndexColor].color,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
          ),
          Positioned(
            top: kToolbarHeight - 22,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: const Icon(Icons.arrow_back_rounded),
                  color: Colors.black,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_rounded),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.12,
            right: 0,
            left: 20,
            child: FittedBox(
              child: Text(
                widget.shoes.category,
                style: kShoeCategory.copyWith(
                    fontSize: 20, color: Colors.grey.shade100),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: size.height * 0.23,
            right: sizeShoes(valueIndexSize, size),
            left: size.height * 0.10,
            child: Hero(
              tag: widget.shoes.name,
              child: Image(
                image:
                    AssetImage(widget.shoes.listImage[valueIndexColor].image),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.78,
            left: 15,
            right: 16,
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
                        height: 4,
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
                              margin: const EdgeInsets.only(right: 36),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: widget.shoes.listImage[index].color,
                                  shape: BoxShape.circle,
                                  border: index == valueIndexColor
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.50,
            right: 16,
            left: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.shoes.category,
                              style: kShoeCategory,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(widget.shoes.name),
                          ],
                        ),
                      ),
                    ),
                    ShakeTransition(
                      left: false,
                      child: Text(
                        widget.shoes.price,
                        style: kShoeCategory.copyWith(
                            fontSize: 25, color: Colors.grey.shade100),
                      ),
                    ),
                  ],
                ),
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
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
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Size",
                        style: kShoePrice.copyWith(
                            fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: List.generate(
                          5,
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
                              color: index == valueIndexSize
                                  ? widget
                                      .shoes.listImage[valueIndexColor].color
                                  : Colors.white,
                              child: Text(
                                "${index + 7}",
                                style: kShoeName == kShoeName
                                    ? kShoeName.copyWith(color: Colors.black)
                                    : kShoeName.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: size.width,
                    color: widget.shoes.listImage[valueIndexColor].color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: const Text(
                      "BUY",
                      style: kTabText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ), // Stack
    );
  }
}
