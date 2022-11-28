import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/shared/widgets/app_bar_widget.dart';
import '../../../repositories/home/home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final test = Modular.get<HomeRepository>();

  Map<String, dynamic> popular = {};
  Map<String, dynamic> topRated = {};

  @override
  void initState() {
    super.initState();
    callMovieApi();
  }

  void callMovieApi() async {
    final responseOne = await test.getPopularMovies();
    setState(() {
      popular = responseOne;
    });

    final responseTwo = await test.getTopRatedMovies();
    print(responseTwo);
    setState(() {
      topRated = responseTwo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 55,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 25,
                    ),
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              InkWell(
                onTap: () => Modular.to.pushNamed('favorites'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 25,
                    ),
                    const Text(
                      'Favoritos',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xff1f1f1f),
        appBar: AppBarWidget(
          title: 'GloboPlay',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Populares',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              if (popular.isNotEmpty) ...[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popular['results'].length,
                    itemBuilder: (context, i) {
                      return Container(
                        width: 150,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Image.network(
                                'https://www.themoviedb.org/t/p/w220_and_h330_face/${popular['results'][i]['poster_path']}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Novidades',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              if (topRated.isNotEmpty) ...[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRated['results'].length,
                    itemBuilder: (context, i) {
                      return Container(
                        width: 150,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Image.network(
                                'https://www.themoviedb.org/t/p/w220_and_h330_face/${topRated['results'][i]['poster_path']}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
