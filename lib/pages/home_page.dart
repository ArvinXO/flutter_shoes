import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shoes/kconstants.dart';
import 'package:flutter_shoes/models/data.dart';
import 'package:flutter_shoes/pages/details_shoes.dart';
import 'package:flutter_shoes/widgets/custom_app_bar.dart';
import 'package:flutter_shoes/widgets/custom_bottom_bar.dart';

import '../kconstants.dart';

class HomePageShoes extends StatefulWidget {
  const HomePageShoes({Key? key}) : super(key: key);
  @override
  State<HomePageShoes> createState() => _HomePageShoesState();
}

class _HomePageShoesState extends State<HomePageShoes> {
  final _pageController = PageController(viewportFraction: 0.75);
  double _currentPage = 0.0;
  double indexPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      if (_currentPage >= 0 && _currentPage < 0.7) {
        indexPage = 0;
      } else if (_currentPage > 0.7 && _currentPage < 1.7) {
        indexPage = 1;
      } else if (_currentPage > 1.7 && _currentPage < 2.7) {
        indexPage = 2;
      }
    });
  }

  Color getColor() {
    late final Color color;
    if (_currentPage >= 0 && _currentPage < 0.7) {
      color = listShoes[0].listImage[0].color;
    } else if (_currentPage > 0.7 && _currentPage < 1.7) {
      color = listShoes[1].listImage[0].color;
    } else if (_currentPage > 1.7 && _currentPage < 2.7) {
      color = listShoes[2].listImage[0].color;
    }
    return color;
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor(),
      body: Column(
        children: [
          const CustomAppBar(),
          Container(
            height: MediaQuery.of(context).size.height * 0.049,
            decoration: curlBox,
            child: SizedBox(
              height: 79,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  listCategory.length,
                  //Wrap text in container with
                  (index) => Text(
                    listCategory[index],
                    style: index == indexPage
                        ? kTabText.copyWith(color: Colors.black)
                        : kTabText.copyWith(
                            color: kGreyColor,
                          ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: listShoes.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final shoes = listShoes[index];
                  final listTitle = shoes.category.split(' ');
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                            return DetailsShoesPage(shoes: shoes);
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 26, right: index == indexPage ? 20.0 : 60.0),
                      child: Transform.translate(
                        offset: Offset(
                          index == indexPage ? 10 : 20,
                          0,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return BackdropFilter(
                              filter: index > indexPage
                                  ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                                  : ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                margin: EdgeInsets.only(
                                  top: index == indexPage ? 10 : 100,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.1),
                                      Colors.white.withOpacity(0.9),
                                    ],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                  borderRadius: BorderRadius.circular(36),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 22),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            shoes.name,
                                            style: kShoeName.copyWith(
                                                fontSize: 18),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              '${listTitle[0]} \n ${listTitle[1]}',
                                              style: kSplitText.copyWith(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: constraints.maxHeight * 0.12,
                                      left: constraints.maxWidth * 0.1,
                                      right: -constraints.maxWidth * 0.09,
                                      bottom: constraints.maxHeight * -0.09,
                                      child: Hero(
                                        tag: shoes.name,
                                        child: Image(
                                          image: AssetImage(
                                            shoes.listImage[0].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -3,
                                      right: 3,
                                      child: Row(
                                        children: [
                                          // indexShoeSizes[index]
                                          for (int i = 0;
                                              i < shoes.listImage.length;
                                              i++)
                                            Container(
                                              width:
                                                  constraints.maxWidth * 0.188,
                                              height:
                                                  constraints.maxHeight * 0.090,
                                              decoration: BoxDecoration(
                                                color: shoes.listImage[i].color,
                                                borderRadius:
                                                    //rounded rectangle if not the first colour
                                                    i == 0
                                                        ? kCircleBox
                                                        : kSquircle,
                                                border: i == 0
                                                    ? Border.all(
                                                        width: 2.5,
                                                        color: Colors.white,
                                                      )
                                                    : Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.2),
                                                      ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
          ),

          Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            child: CustomBottomBar(
              color: getColor(),
            ),
          ), // PageView.builder
        ],
      ),
    );
  }
}
