import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:donation_app_with_map/consts/style.dart';
import 'package:donation_app_with_map/screens/item_count_screen/item_count_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentImageindex = 0;

  List <String> images = [
    'https://img.freepik.com/free-vector/hand-drawn-clothing-donation-illustration_23-2148814803.jpg',
    'https://img.freepik.com/premium-vector/humanitarian-aid-people-donate-clothes-money-with-love_8251-236.jpg?w=2000'
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSag8OwVmQFpGo2YVzZrJlLY-9I8718bH4TA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6lpIF3Qiu655GMbIYkUgK4okqZcotxik3sQ&usqp=CAU',
    'https://cdn.thewirecutter.com/wp-content/media/2022/07/20220330_Clothing-donation_TopArt_3x2.jpg?auto=webp&quality=60&crop=1.91:1&width=1200',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: K.primaryColor,
        title: const Center(
          child: Text(
              'الرئيسية'
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 400.0,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index , reason){
                        setState(() {
                          currentImageindex = index;
                        });
                    }
                  ),
                  items: images.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        // ignore: dead_code
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: K.boxDecoration ,
                            child: OctoImage(
                              image: CachedNetworkImageProvider(
                                item,
                              ),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                  'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                fit: BoxFit.cover
                              ),
                              errorBuilder: (context , url , error){
                                return const BlurHash(
                                    hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj'
                                );
                              },
                              fit: BoxFit.cover,
                              ),
                            );
                      },
                    );
                  }).toList(),
                ),

                K.sizedBoxH,

                AnimatedSmoothIndicator(
                  activeIndex: currentImageindex,
                  count: images.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: K.primaryColor,
                    dotColor: K.black26Color
                  ),
                ),

                K.sizedBoxH,

                MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddItemScreen()));
                  },
                  child: const Text(
                    'تبرع بالملابس',
                    style: TextStyle(
                        color: K.wightColor
                    ),
                  ),
                  color: K.primaryColor,
                  elevation: 5,
                  minWidth: 400,
                  height: 50,

                ),




              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
