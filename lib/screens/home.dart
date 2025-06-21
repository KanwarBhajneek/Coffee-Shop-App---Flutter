import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark, // for iOS
      ),
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: _BottomBar(),
        body: Stack(
          children: [
            const _BlackGradientBackground(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24,
                children: [
                  const SizedBox(height: 44),
                  const _LocationDropDown(),
                  const _SearchTextField(),
                  Center(child: _PromoBanner()),
                  const _CategoriesBar(),
                  const _ListingItems(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlackGradientBackground extends StatelessWidget {
  const _BlackGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF111111), Color(0xFF313131)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        selectedItemColor: const Color(0xFFC67C4E),
        unselectedItemColor: const Color(0xFFA2A2A2),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _ListingItems extends StatelessWidget {
  const _ListingItems({super.key});

  final items = const [
    {
      'name': 'Cafe Mocha',
      'type': 'Deep Foam',
      'price': 4.53,
      'image': 'Assets/Images/CafeMocha.png',
      'rating': 4.8,
    },
    {
      'name': 'Flat White',
      'type': 'Espresso',
      'price': 3.53,
      'image': 'Assets/Images/FlatWhite.png',
      'rating': 4.8,
    },
    {
      'name': 'Cafe Mocha',
      'type': 'Deep Foam',
      'price': 4.53,
      'image': 'Assets/Images/C1.png',
      'rating': 4.7,
    },
    {
      'name': 'Flat White',
      'type': 'Espresso',
      'price': 3.53,
      'image': 'Assets/Images/C2.png',
      'rating': 4.6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 10,
        childAspectRatio: 156 / 238,
        children: items.map((i) {
          return _CofeeItem(
            name: i['name'] as String,
            type: i['type'],
            price: i['price'],
            image: i['image'],
            rating: i['rating'],
          );
        }).toList(),
      ),
    );
  }
}

class _CofeeItem extends StatelessWidget {
  final String name;
  final type;
  final price;
  final image;
  final rating;

  const _CofeeItem({
    super.key,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 140,
                height: 128,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 140,
                  height: 128,
                ),
              ),

              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 51,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(1.00, -0.00),
                      end: Alignment(-0.00, 1.00),
                      colors: [
                        const Color(0xFF111111),
                        const Color(0xFF303030),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(24),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4,
                    children: [
                      SvgPicture.asset(
                        'Assets/Images/ic_star.svg',
                        width: 12,
                        height: 12,
                      ),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            name,
            style: TextStyle(
              color: const Color(0xFF242424),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.50,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            type,
            style: TextStyle(
              color: const Color(0xFFA2A2A2),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.20,
            ),
          ),
          const SizedBox(height: 4),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$ $price',
                style: TextStyle(
                  color: const Color(0xFF050505),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.add, size: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoriesBar extends StatelessWidget {
  const _CategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'All Coffee',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.50,
              ),
            ),
          ),
          ...['Machiato', 'Latte', 'Americano'].map((category) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: ShapeDecoration(
                color: const Color(0x59EDEDED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: const Color(0xFF303030),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          hintText: 'Search coffee',
          hintStyle: TextStyle(
            color: Color(0xFFA2A2A2),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: 0,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              'Assets/Images/ic_search.svg',
              width: 20,
              height: 20,
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 20, minHeight: 20),
          suffixIcon: Icon(Icons.tune, color: Colors.white),
        ),
      ),
    );
  }
}

class _LocationDropDown extends StatelessWidget {
  const _LocationDropDown();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFFA2A2A2),
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: 0.01 * 12,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: 'New York, United States',
          underline: SizedBox(),
          isDense: true,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.5,
            letterSpacing: 0,
          ),
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
          onChanged: (String? newValue) {},
          items: ['New York, United States', 'Los Angeles']
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
              .toList(),
        ),
      ],
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'Assets/Images/promo.png',
          width: double.infinity,
          height: 140,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 24,
          top: 12,
          child: Container(
            width: 60,
            height: 26,
            decoration: BoxDecoration(
              color: Color(0xFFED5151),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Promo',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 24,
          bottom: 12,
          child: Image.asset(
            'Assets/Images/promoText.png',
            width: 204,
            height: 80,
          ),
        ),
      ],
    );
  }
}
