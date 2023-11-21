import 'package:flutter/material.dart';
import 'package:wisata_candi/model/candi.dart';
import 'package:cached_network_image/cached_network_image.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.candi});
  final Candi candi;

  @override
  State<DetailScreen> createState() => _DetailScreenState(candi: candi);
}

//TODO: 1 Implementasi sisa dari DetailScreen
class _DetailScreenState extends State<DetailScreen> {
  _DetailScreenState({required this.candi});
  final Candi candi;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(candi.imageAsset),
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
      ],
    );
  }
}
