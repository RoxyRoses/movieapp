import 'package:flutter/material.dart';
import 'package:movie_app/modules/search/presenter/widgets/categories_widget.dart';
import 'package:xenomorph_design_system/xenomorph_design_system.dart';

import '../domain/entities/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Categories> categories = <Categories>[];

    categories
        .add(Categories('All'));
        categories
        .add(Categories('Movies'));

categories
        .add(Categories('Series'));
        categories
        .add(Categories('Anime'));
        categories
        .add(Categories('Animation'));




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
            SizedBox(height: size.height * 1 / 25,),
            SizedBox(
              height: size.height * 8 / 130,
              child: ListView.builder(
                itemCount: categories.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index){
                  return CategoryWidget(externalPadding: EdgeInsets.only(left: size.width * 2 / 20), height: 50,
                  categoryName: categories[index].name,);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
