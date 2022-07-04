import 'package:flutter/material.dart';
import 'package:flutter_shoes/kconstants.dart';
import 'package:flutter_shoes/models/data.dart';
import 'package:flutter_shoes/pages/details_shoes.dart';
import 'package:flutter_shoes/widgets/custom_app_bar.dart';
import 'package:flutter_shoes/widgets/custom_bottom_bar.dart';

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
            decoration: curlBox,
            child: SizedBox(
              height: 71,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  listCategory.length,
                  (index) => Text(
                    listCategory[index],
                    style: index == indexPage
                        ? kTabText.copyWith(color: Colors.black)
                        : kTabText.copyWith(color: Colors.grey),
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
                        child: LayoutBuilder(builder: (context, constraints) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.only(
                              top: index == indexPage ? 10 : 100,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: Colors.white,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 22),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        shoes.category,
                                        style: kShoeCategory,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        shoes.name,
                                        style: kShoeName,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        shoes.price,
                                        style: kShoePrice,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${listTitle[0]} \n ${listTitle[1]}',
                                          style: kSplitText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 0.35,
                                  left: constraints.maxWidth * 0.15,
                                  right: -constraints.maxWidth * 0.13,
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
                                  bottom: 0,
                                  right: 0,
                                  child: Material(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(86),
                                      bottomRight: Radius.circular(36),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: shoes.listImage[0].color,
                                    child: InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        height: 100,
                                        width: 75,
                                        child: Icon(
                                          Icons.add,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
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
