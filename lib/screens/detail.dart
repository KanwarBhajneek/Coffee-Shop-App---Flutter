import 'package:coffee_shop_app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TopDetailBar(),
              _DetailImage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_CoffeeInfo(), _InfoIcons()],
              ),
              _InfoBar(),
              _CoffeeDescription(),
              _CoffeeSize(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _DetailBottomBar(),
    );
  }
}

class _InfoBar extends StatelessWidget {
  const _InfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: const Color(0xFFE3E3E3),
      indent: 16,
      endIndent: 16,
    );
  }
}

class _CoffeeSize extends StatelessWidget {
  const _CoffeeSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          'Size',
          style: TextStyle(
            color: const Color(0xFF242424),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _SizeWrapper(
              child: Text(
                'S',
                style: TextStyle(
                  color: const Color(0xFF242424),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
            _SizeWrapper(
              color: const Color(0xFFF9F2ED),
              borderColor: const Color(0xFFC67C4E),
              child: Text(
                'M',
                style: TextStyle(
                  color: const Color(0xFFC67C4E),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
            _SizeWrapper(
              child: Text(
                'L',
                style: TextStyle(
                  color: const Color(0xFF242424),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SizeWrapper extends StatelessWidget {
  final child;
  Color? color;
  Color? borderColor;

  _SizeWrapper({required this.child, this.color, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 41,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        border: Border.all(
          width: 1,
          color: borderColor ?? const Color(0xFFE3E3E3),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class _CoffeeDescription extends StatelessWidget {
  const _CoffeeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Description',
          style: TextStyle(
            color: const Color(0xFF242424),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
                style: TextStyle(
                  color: const Color(0xFFA2A2A2),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 1.50,
                ),
              ),
              TextSpan(
                text: 'Read More',
                style: TextStyle(
                  color: const Color(0xFFC67C4E),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoIcons extends StatelessWidget {
  const _InfoIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0x59EDEDED),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            'Assets/Images/detail1.png',
            width: 32,
            height: 32,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0x59EDEDED),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            'Assets/Images/detail2.png',
            width: 32,
            height: 32,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0x59EDEDED),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            'Assets/Images/detail3.png',
            width: 32,
            height: 32,
          ),
        ),
      ],
    );
  }
}

class _DetailImage extends StatelessWidget {
  const _DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'Assets/Images/Detail.png',
        width: double.infinity,
        height: 202,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _CoffeeInfo extends StatelessWidget {
  const _CoffeeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          'Caffe Mocha',
          style: AppTextStyles.detailInfoTitle,
        ),
        Text(
          'Ice/Hot',
          style: AppTextStyles.detailInfoSubtitle,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            SvgPicture.asset(
              'Assets/Images/ic_star.svg',
              width: 20,
              height: 20,
            ),
            Text(
              '4.8 ',
              style: TextStyle(
                color: const Color(0xFF2A2A2A),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '(230)',
              style: TextStyle(
                color: const Color(0xFFA2A2A2),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TopDetailBar extends StatelessWidget {
  const _TopDetailBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      height: kToolbarHeight,
      child: AppBar(
        title: const Text(
          'Detail',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF242424),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: 20,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            iconSize: 24,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _DetailBottomBar extends StatelessWidget {
  const _DetailBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 46),
      height: 118,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  color: const Color(0xFF909090),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.20,
                ),
              ),
              Text(
                '\$ 4.53',
                style: TextStyle(
                  color: const Color(0xFFC67C4E),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              ),
            ],
          ),
          Container(
            height: 56,
            width: 217,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Buy Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
