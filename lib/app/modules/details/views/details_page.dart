import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../repositories/home/home_repository.dart';

class DetailsPage extends StatefulWidget {
  final String args;

  const DetailsPage({Key? key, required this.args}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final test = Modular.get<HomeRepository>();

  Map<String, dynamic> movie = {};
  Map<String, dynamic> similar = {};
  bool loader =
      false; //nao quebrar a pagina antes de chamar a api, vai mostrar apagina depois que a api for chamada

  @override
  void initState() {
    super.initState();
    callMovieApi();
  }

  void callMovieApi() async {
    final responseOne = await test.getDetailsMovie(widget.args); //chama as apis

    final responseTwo = await test.getSimilarMovie(widget.args);
    setState(() {
      movie = responseOne; //seta os objetos
      similar = responseTwo;
      loader = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: loader
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    movie["poster_path"] != null
                        ? Image.network(
                            'https://www.themoviedb.org/t/p/w220_and_h330_face${movie["poster_path"]}',
                            height: 200,
                            width: 100,
                            alignment: Alignment.center,
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie['original_title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie['genres'][0]['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie['overview'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            onPrimary: const Color(0xff3e424d),
                            primary: Colors.white,
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 24.0,
                          ),
                          label: const Text('Assista'), // <-- Text
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            onPrimary: const Color(0xffbbcdd1),
                            primary: Colors.black,
                            minimumSize: const Size(200, 80),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.star,
                            size: 24.0,
                          ),
                          label: const Text('Minha lista'), // <-- Text
                        ),
                      ],
                    ),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const TabBar(
                            tabs: [
                              Tab(text: "Assista também"),
                              Tab(text: "Detalhes"),
                            ],
                          ),
                          SizedBox(
                            height: 310,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                if (similar.isNotEmpty) ...[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: similar['results'].length,
                                      itemBuilder: (context, i) {
                                        return InkWell(
                                          onTap: () => Modular.to.pushNamed(
                                              '/details',
                                              arguments: similar['results'][i]
                                                  ['id']),
                                          child: Container(
                                            width: 150,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                    'https://www.themoviedb.org/t/p/w220_and_h330_face/${similar['results'][i]['poster_path']}'),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                                Container(
                                  color: const Color(0xff1f1f1f),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Ficha Técnica",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Data de lançamento: ",
                                            style: TextStyle(
                                              color: Color(
                                                0xff868686,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            movie['release_date'],
                                            style: const TextStyle(
                                              color: Color(
                                                0xff868686,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Genero: ",
                                            style: TextStyle(
                                              color: Color(
                                                0xff868686,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            movie['genres'][0]['name'],
                                            style: const TextStyle(
                                              color: Color(
                                                0xff868686,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Linguagem original: ",
                                            style: TextStyle(
                                              color: Color(
                                                0xff868686,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            movie['original_language'],
                                            style: const TextStyle(
                                              color: Color(
                                                0xff868686,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Titulo Original: ",
                                            style: TextStyle(
                                              color: Color(
                                                0xff868686,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            movie['original_title'],
                                            style: const TextStyle(
                                              color: Color(
                                                0xff868686,
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
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
