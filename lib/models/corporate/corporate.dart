import 'package:hive_flutter/adapters.dart';
part 'corporate.g.dart';

@HiveType(typeId: 1)
class Corporate extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String date;
  @HiveField(2)
  String forwardAmount;
  @HiveField(3)
  String paidAmount;
  @HiveField(4)
  String remainingAmount;
  @HiveField(5)
  List<Map<String, dynamic>> payHistory;
  Corporate(
      {this.name = 'No Data',
      this.date = 'No Data',
      this.forwardAmount = '0',
      this.paidAmount = '0',
      this.remainingAmount = '0',
      this.payHistory = const []});
}
