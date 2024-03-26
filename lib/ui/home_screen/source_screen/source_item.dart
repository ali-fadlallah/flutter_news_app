import 'package:flutter/material.dart';

import '../../../api/responses/Sources/Source.dart';

class SourceItem extends StatelessWidget {
  final Source source;
  final bool isSelected;

  SourceItem(this.source, this.isSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2.0,
        ),
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            color: isSelected
                ? Colors.white
                : Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
