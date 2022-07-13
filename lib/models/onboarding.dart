class OnBoarding {
  String image;
  String title;
  String subtitle;
  OnBoarding({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final onBoardingList = [
  OnBoarding(
      image: 'assets/images/1.png',
      title: 'تطبيق دكاني',
      subtitle:
          'نوفر لكم جميع منتجات الاسواق العالمية مع مختلف البراندات و العروض القيمة'),
  OnBoarding(
      image: 'assets/images/3.png',
      title: 'تطبيق دكاني',
      subtitle:
          'تصفح جميع المنتجات داخل السوق و حصل على نقاط تساعدك بعملية الشراء'),
  OnBoarding(
      image: 'assets/images/4.png',
      title: 'تطبيق دكاني',
      subtitle:
          'نوفر لكم توصيل على مدى ١٢ ساعة على مدار اليوم لجميع مناطق العراق'),
];
