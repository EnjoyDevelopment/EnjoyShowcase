class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'To deliver the best stuff ever !', category: 'MISSION', imageUrl: 'assets/images/3.png',),
  new IntroItem(title: 'Writing things together is what we do best!', category: 'COLLABORATION', imageUrl: 'assets/images/1.png',),
  new IntroItem(title: 'Occasionally wearing pants is a good idea.', category: 'CULTURE', imageUrl: 'assets/images/2.png',),
  new IntroItem(title: 'We might have the best team spirit ever.', category: 'SPIRIT', imageUrl: 'assets/images/3.png',),
  new IntroItem(title: 'Disrupting stuff through first pricniple thinking', category: 'THINKING', imageUrl: 'assets/images/3.png',),
  new IntroItem(title: '', category: '', imageUrl: '',), //dead page 

];