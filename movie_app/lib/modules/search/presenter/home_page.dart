import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app/modules/search/domain/entities/results.dart';
import 'package:movie_app/modules/search/presenter/states/triple/moviestore.dart';
import 'package:movie_app/modules/search/presenter/widgets/card_widget.dart';
import 'package:movie_app/modules/search/presenter/widgets/categories_widget.dart';
import 'package:xenomorph_design_system/xenomorph_design_system.dart';

import '../domain/entities/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<MovieStore>();
  List<Categories> categories = <Categories>[];

  @override
  void initState() {
    store.add();
    super.initState();
    categories.add(Categories('All', false));
    categories.add(Categories('Movies', false));

    categories.add(Categories('Series', false));
    categories.add(Categories('Anime', false));
    categories.add(Categories('Animation', false));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themedark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: (() => debugPrint('drawer')),
              icon: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 6 / 330,
                  top: size.width * 6 / 330,
                  bottom: size.width * 6 / 330,
                ),
                child: SizedBox(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('assets/images/menu1.png'),
                  ),
                ),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: (() => debugPrint('search')),
            icon: SizedBox(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset('assets/images/search.png'),
              ),
            ),
          ),
          IconButton(
            onPressed: (() => debugPrint('settings')),
            icon: SizedBox(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset('assets/images/settings.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.only(left: size.width * 4 / 120),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        color: const Color(0xffD8D8DA),
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 2 / 50),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 1 / 25,
            ),
            SizedBox(
              height: size.height * 8 / 130,
              child: ListView.builder(
                itemCount: categories.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return CategoryWidget(
                    externalPadding: EdgeInsets.only(left: size.width * 2 / 25),
                    height: 35,
                    categoryName: categories[index].name,
                    tap: () {
                      setState(
                        () {
                          for (var element in categories) {
                            element.isSelected = false;
                          }
                          categories[index].isSelected = true;
                        },
                      );
                    },
                    isSelected: categories[index].isSelected,
                  );
                }),
              ),
            ),
            SizedBox(height: size.height * 1 / 50),
            ScopedBuilder<MovieStore, Exception, List<Results>>(
              store: store,
              onError: (_, Exception? error) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Something went wrong'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                return const Center(
                  child: Icon(
                    Icons.search_off_rounded,
                    size: 150,
                  ),
                );
              },
              onLoading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              onState: (_, List state) => Center(
                child: SizedBox(
                  height: size.height * 400 / 490,
                  width: size.width * 1,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, int index) {
                      Results result = store.state[index];
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CardWidget(
                            height: 280,
                            imagePath: result.posterPath,
                            movieName: result.title,
                            accent: result.originalLanguage,
                            releaseDate: result.releaseDate,
                            voteAverage: result.voteAverage,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
