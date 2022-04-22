import 'package:flutter/material.dart';
import 'package:xenomorph_design_system/xenomorph_design_system.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body:  Column(
        children: [
          const SizedBox(height: 18),
          Padding(
            padding:  EdgeInsets.only(left: size.width * 4 / 120),
            child: Text(
              'Categories',
              style: TextStyle(color: const Color(0xffD8D8DA), fontWeight: FontWeight.bold, fontSize: size.height *  2 / 50),
            ),
          ),
        ],
      ),
    );
  }
}
