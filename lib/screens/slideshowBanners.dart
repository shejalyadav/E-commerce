import 'package:flutter/material.dart';

class SlideshowBanners extends StatefulWidget {
  @override
  _SlideshowBannersState createState() => _SlideshowBannersState();
}

class _SlideshowBannersState extends State<SlideshowBanners> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView(
            controller: _pageController,
            children: [
              Image.network(
                'https://img.freepik.com/premium-vector/final-sale-discount-special-offer-header-banner-template-last-chance-shop-now-with-wholesale-advertisement-up-70-percent-off-money-save-shopping-online-announcement-vector-illustration_419341-620.jpg',
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://img.freepik.com/premium-vector/website-header-with-hot-deal-sale-up-percent-off_419341-576.jpg',
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://marketplace.canva.com/EAFPjajuh4A/3/0/1600w/canva-orange-colorful-retro-fashion-sale-email-header-QhaK1EZtwDY.jpg',
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://marketplace.canva.com/EAFinOH6AsM/1/0/1600w/canva-white-geometric-fashion-sale-discount-email-header-FosaZa_Gvxc.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? Colors.deepPurple
                    : Colors.deepPurple.withOpacity(0.3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
