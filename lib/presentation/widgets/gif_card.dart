import 'package:flutter/material.dart';
import '../../data/models/gif_model.dart';

class GifCard extends StatelessWidget {
  final GifModel gif;

  GifCard({required this.gif});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(gif.url),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gif.title),
          ),
        ],
      ),
    );
  }
}
