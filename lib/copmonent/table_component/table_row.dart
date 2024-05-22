import 'package:flutter/material.dart';

import 'package:home_tools/copmonent/table_component/cell_component.dart';

class TableCellRow extends StatelessWidget {
  final String productName;
  final String mainPrice;
  final String customerPrice;

  const TableCellRow({
    super.key,
    required this.productName,
    required this.mainPrice,
    required this.customerPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          CellComponent(cellName: customerPrice),
          CellComponent(cellName: mainPrice),
          Row(
            children: [
              CellComponent(
                cellName: productName,
                fontSize: 5,
                fontWeight: FontWeight.bold,
              ),
            ],
          )
        ])
      ],
    );
  }
}
