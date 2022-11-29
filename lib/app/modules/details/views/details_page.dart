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
      body: Container(
        alignment: Alignment.center,
        child: Text(
          widget.args,
        ),
      ),
    );
  }
}
