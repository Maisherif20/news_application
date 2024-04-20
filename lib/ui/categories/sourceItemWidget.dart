import 'package:flutter/material.dart';
import '../../sourceResponse/SourceResponse.dart';

class SourceItemWidget extends StatelessWidget {
  Source source;
  bool isSelecteed;
  SourceItemWidget({required this.source, required this.isSelecteed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          color: isSelecteed ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: Colors.green, width: 3)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            fontSize: 20,
            color: isSelecteed ? Colors.white : Colors.green,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
