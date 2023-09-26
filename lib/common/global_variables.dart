import 'package:flutter/material.dart';

class GlobalVariables {
  // static const baseUrl = 'http://103.150.93.77:1339';
  static const baseUrl = 'http://103.175.220.91:1339';
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];

  static const List<String> bannerImages = [
    'https://s4.bukalapak.com/cinderella/ad-inventory/64f69c5793dc672ddf8f57ee/w-640/Home%20Banner%20Bukalapak%20Desktop%20%5B1668x704%5D-1693883477089.jpg.webp',
    'https://s4.bukalapak.com/cinderella/ad-inventory/64eed8ba594b9081bfe6e440/w-640/Home%20Banner%20Bukalapak_Desktop%20%5B1668x704%5D-1693374647273.jpg.webp',
    'https://s4.bukalapak.com/cinderella/ad-inventory/64f6cc3ed83c74ec29ad8126/w-640/DESK_Home_Banner_2018%20%5B1668x704%5D%20(1)-1693895740501.jpg.webp',
    'https://s4.bukalapak.com/cinderella/ad-inventory/65102abce1858c49e113c444/w-640/Home%20Banner%20Bukalapak%20Desktop%20%5B1668x704%5D%20(4)-1695558328296.jpg.webp',
  ];

  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color(0xffEE4D2D);
  static const unselectedNavBarColor = Colors.black87;
}
