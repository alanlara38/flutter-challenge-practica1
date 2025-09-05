import 'package:flutter/material.dart';
import '../models/hero_model.dart';
import '../widgets/hero_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo
    final List<HeroModel> heroes = [
      const HeroModel(
         name: "Aventador",
        image: 'assets/images/avee.png', 
        speed: 95, 
        health: 80, 
        attack: 90, 
      ),
      const HeroModel(
        name: "Porsche",
        image: 'assets/images/pors.png',
        speed: 98.0,
        health: 85.0,
        attack: 75.0,
      ),
      const HeroModel(
        name: "Ferrari",
        image: 'assets/images/ferra.png',
        speed: 10.0,
        health: 80.0,
        attack: 80.0,
      )
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 15, 15, 15), Color.fromARGB(255, 180, 183, 3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 30),
          itemCount: heroes.length,
          itemBuilder: (context, index) {
            return HeroCard(hero: heroes[index]);
          },
        ),
      ),
    );
  }
}