import 'package:flutter/cupertino.dart';

class CategoryWidget extends StatelessWidget {
  final double height;
  final double width;
  final String categoryName;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? externalPadding;
  final bool isSelected;
  final Function()? tap;

  const CategoryWidget(
      {Key? key,
      this.isSelected = false,
      this.padding,
      this.externalPadding = const EdgeInsets.only(left: 5),
      this.tap,
      this.categoryName = 'all',
      this.height = 89,
      this.width = 90})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late EdgeInsetsGeometry? localPadding;

    if (padding == null) {
      localPadding = EdgeInsets.all(height * 0.22);
    } else {
      localPadding = padding;
    }

    Color localColor = const Color(0xffDFDFE1);
    Color fontColor = const Color(0xff0F1122);

    switch (isSelected) {
      case true:
        localColor = const Color(0xff2F40AE);
        fontColor = const Color(0xffDFDFE1);
        break;
      case false:
        localColor = const Color(0xff000000);
        fontColor = const Color(0xffDFDFE1);
        break;
      default:
    }
     return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: externalPadding ?? const EdgeInsets.all(0.8),
        child: Center(
          child: Container(
            width: width,
            height: height,
            padding: localPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height * 30 / 89),
              color: localColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, 
              children: [
                FittedBox(
                  child: Text(
                    categoryName,
                    style:
                        TextStyle(fontSize: height * 35 / 89, color: fontColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
