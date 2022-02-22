import 'package:flutter/material.dart';


class ColorFilters {
  static final greyscale = ColorFilter.matrix(<double>[
    /// greyscale filter
    0.7526, 0.2552, 0.2552, 0, 0,
    0.2552, 0.7526, 0.2552, 0, 0,
    0.2552, 0.2552, 0.7526, 0, 0,
    0, 0, 0, 1, 0
  ]);
}

class imageOverlay extends StatelessWidget{
  Widget build(BuildContext context){
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Color.fromRGBO(0, 0, 0, 0.8),
            Color.fromRGBO(0, 0, 0, 0.8),
          ],
        ),
      ),
    );
  }
}