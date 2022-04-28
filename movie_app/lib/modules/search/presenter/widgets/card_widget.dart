import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/modules/search/presenter/states/triple/moviestore.dart';

class CardWidget extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final String movieName;
  final String releaseDate;
  final String accent;
  final double voteAverage;
  final triple = Modular.get<MovieStore>();
  CardWidget(
      {Key? key,
      this.height = 256,
      this.width = 630,
      this.imagePath = '',
      this.movieName = '',
      this.accent = '',
      this.releaseDate = '',
      this.voteAverage = 0.0})
      : super(key: key);
      
    var url = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 20 / 632,
                  right: size.width * 20 / 632,
                  bottom: size.width * 8 / 632),
              child: Container(
                padding: EdgeInsets.all(size.height * 4 / 632),
                height: height * (size.height / 1334),
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 15 / 200),
                    color: const Color(0xff0F1122)),
                child: Row(
                  children: [
                    SizedBox(
                      height: height,
                      width: size.width * 60 / 250,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(height * 15 / 200),
                              color: Colors.amber),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(height * 50 / 200),
                              child: checkImageNull(imagePath),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 3 / 200,
                                bottom: size.height * 2 / 200),
                            child: Text(
                              movieName,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 20 / 632,
                                color: const Color(0xffD8D8DA),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 3 / 200,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Language:',
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 15 / 632,
                                    color: const Color(0xff4B4E5C),
                                  ),
                                ),
                                Text(
                                  accent,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 15 / 632,
                                    color: const Color(0xffD8D8DA),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 3 / 200,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Release Date:',
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 15 / 632,
                                    color: const Color(0xff4B4E5C),
                                  ),
                                ),
                                Text(
                                  checkNull(releaseDate),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 15 / 632,
                                    color: const Color(0xffD8D8DA),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 142 / 256,
                                    top: size.height * 10 / 180),
                                child: Container(
                                  height: size.height * 8 / 180,
                                  width: size.width * 25 / 256,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          height * 2 / 200),
                                      color: const Color(0xffF8D00B)),
                                  child: Center(
                                    child: Text(
                                      voteAverage.toString(),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 15 / 632,
                                        color: const Color(0xff0F1122),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: height * 15 / 256,
              top: height * 15 / 256,
              child: FavoriteButton(
                iconSize: height * 40 / 256,
                valueChanged: (_isFavorite) {
                  debugPrint('Is Favorite $_isFavorite)');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String checkNull(String string) {
    if (string == "") {
      string = 'not avaiable';
      return string;
    }
    return string;
  }

   checkImageNull(String image) {
    if (image == "") {
      return Image.asset('assets/images/error.png');
    }
    return Image.network(url + image);
  }
}
