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
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    size: 24.0,
                  ),
                  label: Text('Download'), // <-- Text
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.star,
                    size: 24.0,
                  ),
                  label: Text('Download'), // <-- Text
                ),
              ],
            ),
          ],
        ));
  }
}
