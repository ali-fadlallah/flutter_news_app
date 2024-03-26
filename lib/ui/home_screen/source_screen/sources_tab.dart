import 'package:flutter/material.dart';
import 'package:news/api/responses/Sources/Source.dart';
import 'package:news/ui/home_screen/news_screen/news_widget.dart';
import 'package:news/ui/home_screen/source_screen/source_item.dart';

class SourcesTab extends StatefulWidget {
  final List<Source> sourceList;

  SourcesTab(this.sourceList, {Key? key}) : super(key: key);

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedTab = index;
              setState(() {});
            },
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sourceList
                .map(
                  (source) => SourceItem(source,
                      widget.sourceList.elementAt(selectedTab) == source),
                )
                .toList(),
          ),
          Expanded(child: NewsWidget(widget.sourceList[selectedTab])),
        ],
      ),
    );
  }
}
