import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/hero_model.dart';
import '../screens/details_page.dart';
import 'attribute_widget.dart';

// Función para convertir grados a radianes
double radians(double degrees) => degrees * (math.pi / 180);

class HeroCard extends StatelessWidget {
  final HeroModel hero;
  final double rowHeight = 280;

  const HeroCard({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailsPage(hero: hero)),
        );
      },
      child: Container(
        height: rowHeight,
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Contenedor trasero
            Transform.translate(
              offset: const Offset(-20, 0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateY(radians(1.5)),
                child: Container(
                  height: 220,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(80)), //esquina redondeada
                  ),
                ),
              ),
            ),
            // Contenedor frontal
            Transform.translate(
              offset: const Offset(-44, 0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateY(radians(8)),
                child: Container(
                  height: 210,
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(90)),
                  ),
                ),
              ),
            ),
            // Imagen del Héroe (con el widget Hero para la animación)
            Align(
              alignment: Alignment.centerLeft,
              child: Transform.translate(
                offset: const Offset(-0.5, 0),
                child: Hero(
                  tag: hero.image, // Tag único para la animación
                  child: Image.asset(
                    hero.image,
                    width: rowHeight,
                    height: rowHeight,
                  ),
                ),
              ),
            ),
            // Atributos y botón
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 45),
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AttributeWidget(
                      progress: hero.speed,
                      child: Image.asset('assets/images/velo.png'),
                    ),
                    AttributeWidget(
                      progress: hero.health,
                      child: Image.asset('assets/images/diseño.png'),
                    ),
                    AttributeWidget(
                      progress: hero.attack,
                      child: Image.asset('assets/images/mo.png'),
                    ),
                    SizedBox(
                      height: 32,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Ver detalles',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}