import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/modules/search/presenter/states/triple/moviestore.dart';

class CardWidget extends StatelessWidget {
  final double height;
  final double width;
  final triple = Modular.get<MovieStore>();
  CardWidget({Key? key, this.height = 256, this.width = 630}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 8 / 632,
                right: size.width * 8 / 632,
                bottom: size.width * 8 / 632),
            child: Container(
              padding: EdgeInsets.all(size.height * 8 / 632),
              height: height * (size.height / 1334),
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 25 / 200),
                  color: const Color(0xff0F1122)),
              child: Row(
                children: [
                  SizedBox(
                    height: height,
                    child: const AspectRatio(
                      aspectRatio: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
