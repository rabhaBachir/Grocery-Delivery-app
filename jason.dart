import 'package:grocery_delivery_app/classes/product.dart';

import 'classes/category.dart';

Category cat1 = new Category("assets/fruit.jpg", "Fruit");
Category cat2 = new Category("assets/vegetable.jpg", "Vegetables");
Category cat3 = new Category("assets/meat.jpg", "Meat ");
Category cat4 = new Category("assets/dairy.jpg", "Dairy");
Category cat5 = new Category("assets/snackes.jpg", "Snackes");
Category cat6 = new Category("assets/drink.jpg", "Drinks ");
List<Category> listcat = [cat1, cat2, cat3, cat4, cat5, cat6];
////
Product prod1 =
    new Product("assets/frase.jpg", "Strawberry", 5.00, 20, 1, false);
Product prod2 = new Product("assets/kiwi.jpg", "kiwi", 8.00, 9, 1, false);

Product prod3 =
    new Product("assets/michmich.jpg", "Apricot", 10.00, 10, 1, false);

Product prod4 = new Product("assets/pome.jpg", "Apple", 7.00, 30, 1, false);

Product prod5 = new Product("assets/panane.jpg", "Banana", 12.00, 8, 1, false);

List<Product> listProduct = [prod1, prod2, prod3, prod4, prod5];
List<Product> listProductFav = [];
List<Product> listCommend = [];
double total = 0;
