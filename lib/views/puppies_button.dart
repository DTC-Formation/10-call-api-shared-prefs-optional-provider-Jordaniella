import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dark_mode.dart';

class ButtonPuppies extends StatefulWidget {
  final bool isSimple;
  final Color bgColor;
  final String urlPage;
  final String content;
  final IconData icone;
  final bool? isActive;
  final double? size;
  const ButtonPuppies(
      {super.key,
      this.isActive,
      this.size,
      required this.icone,
      required this.content,
      required this.isSimple,
      required this.bgColor,
      required this.urlPage});

  @override
  State<ButtonPuppies> createState() => _ButtonPuppiesState();
}

class _ButtonPuppiesState extends State<ButtonPuppies> {
  @override
  Widget build(BuildContext context) {
    Widget createButton(bool type) {
      if (type) {
        return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            widget.icone,
            color: context.watch<DarkProvider>().textColor,
          ),
          const Spacer(flex: 2),
          Text(
            widget.content,
            style: TextStyle(color: context.watch<DarkProvider>().textColor),
          )
        ]);
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icone,
            color: context.watch<DarkProvider>().textColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.content,
              style: TextStyle(color: context.watch<DarkProvider>().textColor),
            ),
          )
        ],
      );
    }

    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, widget.urlPage);
        },
        child: Container(
            width: widget.size ?? widget.content.length * 12,
            height: widget.size ?? 37,
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
            decoration: BoxDecoration(
                color: widget.bgColor, borderRadius: BorderRadius.circular(15)),
            child: createButton(widget.isSimple)));
  }
}
