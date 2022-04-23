import 'package:flutter/cupertino.dart';

class CategoryWidget extends StatelessWidget {
  final double height;
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
      this.height = 89})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late EdgeInsetsGeometry? localPadding;

    if (padding == null) {
      localPadding = EdgeInsets.all(height * 0.22);
    } else {
      localPadding = padding;
    }

    Color localColor = const Color(0xff0F1122);
    Color fontColor = const Color(0xffDFDFE1);
    String imagePath = '';

    switch (isSelected) {
      case true:
        localColor = const Color(0xff2F40AE);
        fontColor = const Color(0xffDFDFE1);
        break;
      case false:
        localColor = const Color(0xffFFFFFF);
        fontColor = const Color(0xff000000);
        break;
      default:
    }
     return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: externalPadding ?? const EdgeInsets.all(0.8),
        child: Center(
          child: Container(
            height: height,
            padding: localPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height * 25 / 89),
              color: localColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, 
              children: [
                SizedBox(width: height * 20 / 89),
                FittedBox(
                  child: Text(
                    categoryName,
                    style:
                        TextStyle(fontSize: height * 25 / 89, color: fontColor),
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
