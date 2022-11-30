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

  @override
  void initState() {
    super.initState();
    callMovieApi();
  }

  void callMovieApi() async {
    final responseTwo = await test.getDetailsMovie(widget.args);
    print(responseTwo);
    setState(() {
      movie = responseTwo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash.png',
                height: 200,
                width: 100,
                alignment: Alignment.center,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Orgulho e Paixao",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Novela",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Orgulho e Paixao olaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  onPrimary: Color(0xff3e424d),
                  primary: Colors.white,
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  size: 24.0,
                ),
                label: Text('Play'), // <-- Text
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  onPrimary: Color(0xffbbcdd1),
                  primary: Colors.black,
                  minimumSize: Size(200, 80),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.star,
                  size: 24.0,
                ),
                label: Text('Minha lista'), // <-- Text
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton(
                child: Text("Assista também"),
                onPressed: () {
                  print('You selected all posts');
                },
              ),
              OutlinedButton(
                child: Text("Detalhes"),
                onPressed: () {
                  print('You selected all posts');
                },
              ),
            ],
          ),
          Expanded(
            flex: 10,
            child: Container(
                color: Color(0xff1f1f1f),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ficha Técnica",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Olaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      style: TextStyle(
                        color: Color(
                          0xff868686,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
