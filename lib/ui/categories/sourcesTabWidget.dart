import 'package:flutter/material.dart';
import 'package:news_application/sourceResponse/SourceResponse.dart';
import 'package:news_application/ui/categories/sourceItemWidget.dart';
import 'package:news_application/ui/news/newsListWidget.dart';

class SourcesTabWidget extends StatefulWidget {
  List<Source> sources;
  SourcesTabWidget({required this.sources});

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (newIndex) {
                selectedIndex = newIndex;
                setState(() {});
              },
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => SourceItemWidget(
                        source: source,
                        isSelecteed:
                            widget.sources.indexOf(source) == selectedIndex,
                      ))
                  .toList(),
            ),
            NewsListWidget(source:widget.sources[selectedIndex])
          ],
        ));
  }
}
