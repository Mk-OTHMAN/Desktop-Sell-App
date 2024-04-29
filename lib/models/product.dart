import 'package:hive_flutter/adapters.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String quantity;
  @HiveField(2)
  String mainPrice;
  @HiveField(3)
  String customerPrice;
  Product(
      {this.name = 'No Data',
      this.quantity = 'No Data',
      this.mainPrice = 'No Data',
      this.customerPrice = 'No Data'});
}
