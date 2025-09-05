import 'package:flutter/material.dart';
import '../models/hero_model.dart';

class DetailsPage extends StatelessWidget {
  final HeroModel hero;

  const DetailsPage({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 221, 255, 0), Color.fromARGB(255, 8, 8, 15)],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            // Contenido principal
            ListView(
              padding: EdgeInsets.only(top: AppBar().preferredSize.height + 40),
              children: [
                _HeroDetailsImage(image: hero.image),
                _HeroDetailsName(heroName: hero.name),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                  child: Text(
                    "Puros carrazos",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 28),
                _ActionButtons(),
                const SizedBox(height: 28),
              ],
            ),
            // Barra de navegación personalizada
            _CustomAppBar(),
          ],
        ),
      ),
    );
  }
}

// Widgets privados para organizar el código de la pantalla de detalles

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const Text(
              'Overview',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDetailsImage extends StatelessWidget {
  final String image;
  const _HeroDetailsImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(28)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(28)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(28)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  // Widget Hero para la animación de la imagen
                  child: Hero(
                    tag: image,
                    child: Image.asset(image),
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

class _HeroDetailsName extends StatelessWidget {
  final String heroName;
  const _HeroDetailsName({required this.heroName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              heroName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 42,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                heroName,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.1),
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 28),
        Expanded(
          child: SizedBox(
            height: 54,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Agregar a favoritos', style: TextStyle(fontSize: 14)),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 170, 213, 12), Color.fromARGB(255, 2, 7, 12)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                  alignment: Alignment.center,
                  child: const Text('OK', style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 28),
      ],
    );
  }
}