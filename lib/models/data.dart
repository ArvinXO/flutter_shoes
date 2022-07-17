import 'package:flutter/material.dart';
import 'package:flutter_shoes/models/shoes.dart';

final listCategory = ['Basketball', 'Running', 'Training'];

final List<Shoes> listShoes = [
  Shoes(
    'AIR JORDAN 1 MID',
    'NIKE AIR',
    '120',
    4,
    [
      ImageShoes(
        'assets/J_001.png',
        const Color(0xffEAA906),
      ),
      ImageShoes(
        'assets/J_002.png',
        const Color(0xff08B894),
      ),
      ImageShoes(
        'assets/J_003.png',
        const Color(0xffB50D0D),
      ),
      ImageShoes(
        'assets/J_004.png',
        const Color(0xff229954),
      ),
    ],
    [7, 8, 9, 10, 11, 12],
  ),
  Shoes(
    'NIKE BLAZER MID',
    'NIKE AIR',
    '150',
    4,
    [
      ImageShoes(
        'assets/Z_001.png',
        const Color(0xff08B894),
      ), // ImageShoes
      ImageShoes(
        'assets/Z_002.png',
        const Color(0xffb80606),
      ), // ImageShoes
      ImageShoes(
        'assets/Z_003.png',
        const Color(0xff12a819),
      ),
      ImageShoes(
        'assets/Z_004.png',
        const Color(0xffAC501A),
      ), // ImageShoes
    ],
    [7, 8, 9, 10, 11, 12],
  ),
  Shoes(
    'Zoomx Vaporfly',
    'NIKE ZOOM',
    '180',
    4,
    [
      ImageShoes(
        'assets/N_001.png',
        const Color(0xff7B7A41),
      ), // ImageShoes
      ImageShoes(
        'assets/N_002.png',
        const Color(0xff5d08e7),
      ), // ImageShoes
      ImageShoes(
        'assets/N_003.png',
        const Color(0xff000000),
      ), // ImageShoes
      ImageShoes(
        'assets/N_004.png',
        const Color(0xdc72e30e),
      ),
    ],
    [7, 8, 9, 10, 11, 12],
  ),
]; // Shoes
