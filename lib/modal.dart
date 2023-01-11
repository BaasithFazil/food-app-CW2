

class ItemModel {
  final String title;
  final String description;
  final String imageUrl;
  final String price;

  ItemModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

final allitems = <ItemModel> [
  ItemModel(title: "Pizza", description: "hello", imageUrl: "assets/food/food1.jpg", price: "1"),
];

final items = <ItemModel>[
  ItemModel(
      title: 'Pizza',
      description: 'This is Pizza with margerita cheese. Added chicken peices and jellapino. Available in Small, Regular and Large sizes. ',
      imageUrl: 'assets/food/food1.jpeg',
      price: '2000/='
  ),
  ItemModel(
      title: 'Burger',
      description: 'Juicy, big, loaded with toppings of my choice. High quality beef medium to well with cheese and bacon on a multigrain bun. A huge single or triple burger with all the fixings, cheese, lettuce, tomato, onions and special sauce or mayonnaise!',
      imageUrl: 'assets/food/food2.jpg',
      price: '1500/='
  ),
  ItemModel(
      title: 'Shawarma',
      description: 'Shawarma is marinated with various seasonings and spices such as cumin, turmeric, and paprika. It is made by stacking thinly sliced meat, typically lamb, beef, or chicken, on a large rotating skewer or cone. It is also sometimes cooked with extra fat from the meat to give it a juicer taste',
      imageUrl: 'assets/food/food3.png',
      price: '800/='
  ),
  ItemModel(
      title: 'Submarine',
      description: 'This Chicken submarine bun contains grilled Spicy Chicken, sauteed capsicums, onions, cheese, mayo in a sesame bun.',
      imageUrl: 'assets/food/food4.jpg',
      price: '1200/='
  ),
  ItemModel(
      title: 'Rice & Curry',
      description: 'A vegan/vegetarian”rice puller” as we like to call it. A combination of fried onions and banana flower fried and then mixed together with a few other ingredients.This simple dish, not only adds colour to the menu but is an authentic',
      imageUrl: 'assets/food/food5.png',
      price: '700/='
  ),
];
