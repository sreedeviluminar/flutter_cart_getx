class Product {
  String name;
  String price;
  String description;
  int count;
  String image;

  Product(this.name, this.price, this.description, this.count, this.image);
}

List<Product> productList = [
  Product('item1', "100\$", 'pizza', 0, 'asset/images/s1.png'),
  Product('item2', "200\$", 'donut', 0, 'asset/images/s2.png'),
  Product('item3', "300\$", 'grapes', 0, 'asset/images/s3.png'),
  Product('item4', "400\$", 'burger', 0, 'asset/images/s4.png'),
  Product('item5', "500\$", 'salad', 0, 'asset/images/s5.png'),
  Product('item6', "600\$", 'lemon', 0, 'asset/images/s6.png'),
  Product('item7', "700\$", 'pineapple', 0, 'asset/images/s7.png'),
  Product('item8', "800\$", 'pizzaLarge', 0, 'asset/images/s8.png'),
  Product('item9', "900\$", 'noodles', 0, 'asset/images/s9.png'),
];

