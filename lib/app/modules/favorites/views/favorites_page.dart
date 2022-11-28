import 'package:app_test/app/core/shared/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

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
                onTap: () => Modular.to.pushNamed('/'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
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
                onTap: () => Modular.to.pushNamed('/favorites'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
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
        backgroundColor: const Color(0xff1f1f1f),
        appBar: const AppBarWidget(
          title: 'Minha Lista',
        ),
      ),
    );
  }
}
