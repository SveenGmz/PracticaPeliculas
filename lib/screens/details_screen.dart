import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.toString() ?? 'Sin nombre';
    return const Scaffold(
        body: CustomScrollView(
      //widget con comportamientos predefinidos
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate.fixed(
                [_PosterAndTitle(), _Overview(), ActorSlider()]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      floating: false,
      pinned: true,

      //WINGET PARA QUE SE AJUSTE EL TAMAÑO
      //Que todo desaparezca
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //eliminar padding
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 18),
          ),
        ),
        background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: AssetImage('assets/no-image.jpg')),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: AssetImage('assets/no-image.jpg'),
            height: 250,
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: TextStyle(fontSize: 30),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'movie.titleOriginal',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.start_outlined,
                  size: 20,
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 5),
                Text(
                  'movie.voteAverage',
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            )
          ],
        ))
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: const Text(
        'Laboris qui reprehenderit tempor culpa et eu quis aliquip magna ea deserunt nostrud et ipsum. Ad minim consequat laboris ut Lorem aliqua ut duis ut voluptate minim consequat Lorem cupidatat. Veniam irure reprehenderit ad irure adipisicing nisi eu ex incididunt veniam nisi exercitation. Ex deserunt non et ipsum est sint enim occaecat enim est reprehenderit. Sunt tempor id ex pariatur ut do do sit aliqua et.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}

class ActorSlider extends StatelessWidget {
  const ActorSlider({super.key});

  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: Size.height * 0.30,
      color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Actores',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) {
                // Agrega la imagen aquí
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const FadeInImage(
                        placeholder: AssetImage('assets/no-image.jpg'),
                        image: AssetImage('assets/no-image.jpg'),
                        width: 130,
                        height: 165,
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
