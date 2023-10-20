import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_moviles/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    //determinarl el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        //numero de elementos que va a tener
        itemCount: movies.length,
        //carrucel en uso
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        //constructor del swiper
        itemBuilder: (_, int index) {
          final movie = movies[index];
          //print(movie.posterPath);
          //print(movie.fullPosterImg);
          return GestureDetector(
            //pasar el id de la pelicula que estoy seleccionando en arguments
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
              ),
            ),
          );
        },
      ),
    );
  }
}
