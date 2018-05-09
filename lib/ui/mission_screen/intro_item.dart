class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
    this.pageNumber,

  });

  final String title;
  final String category;
  final String imageUrl;
  final int pageNumber;

}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'To deliver the best stuff ever !', category: 'MISSION', imageUrl: 'assets/images/3.png',pageNumber: 1),
  new IntroItem(title: 'Writing things together is what we do best!', category: 'COLLABORATION', imageUrl: 'assets/images/1.png',pageNumber: 2),
  new IntroItem(title: 'Occasionally wearing pants is a good idea.', category: 'CULTURE', imageUrl: 'assets/images/2.png',pageNumber: 3),
  new IntroItem(title: 'We might have the best team spirit ever.', category: 'SPIRIT', imageUrl: 'assets/images/3.png',pageNumber: 4),
  new IntroItem(title: 'Disrupting stuff through first pricniple thinking', category: 'THINKING', imageUrl: 'assets/images/3.png' ,pageNumber: 5,),
  new IntroItem(title: '', category: '', imageUrl: '', pageNumber: 6), //dead page 

];