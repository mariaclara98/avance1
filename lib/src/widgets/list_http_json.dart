import 'package:flutter/material.dart';
import 'package:flutter_movie_api/src/models/movie_model.dart';
import 'package:flutter_movie_api/src/services/movie_service.dart';

class ListHtppJson extends StatefulWidget {
  const ListHtppJson({super.key});

  @override
  State<ListHtppJson> createState() => _ListHtppJsonState();
}

class _ListHtppJsonState extends State<ListHtppJson> {
  List<Movie>? _list;

  @override
  void initState() {
    super.initState();
    _downloadData();
  }

  @override
  Widget build(BuildContext context) {
    return _list == null
        ? const Center(
            child: Column(
              children: [
                Text("Descargando el contenido"),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox.square(
                      dimension: 50.0, child: CircularProgressIndicator()),
                )
              ],
            ),
          )
        : _list!.isEmpty
            ? const Center(child: Text("No hay datos"))
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _list!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Movie movie = _list![index];
                  return Card(
                      child: ListTile(
                    title: Text(movie.title),
                    subtitle: Text("Fecha de estreno: ${movie.year}"),
                    leading: Text(movie.id.toUpperCase()),
                    trailing: Image.network(
                      movie.image,
                      width: 50.0, // Ajusta el ancho
                      height: 50.0, // Ajusta la altura
                      fit: BoxFit.cover, // Ajusta la forma de la imagen
                    ),
                  ));
                },
              );
  }

  _downloadData() async {
    MovieService service = MovieService();
    _list = await service.getContent();
    if (mounted) {
      setState(() {});
    }
  }
}
