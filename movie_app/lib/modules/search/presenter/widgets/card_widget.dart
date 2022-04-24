import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/modules/search/presenter/states/triple/moviestore.dart';

class CardWidget extends StatelessWidget {
  final triple = Modular.get<MovieStore>();
  CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        child: Stack(children: [
          Padding(padding: EdgeInsets.only(left: size.width * 8 / 632, right: size.width * 8 / 632, bottom: size.width * 8 / 632),
          child: Container(),)
        ]),
      ),
    );
  }
}
