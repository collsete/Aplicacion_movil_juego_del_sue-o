import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PorfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const PorfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(Colors.white),
          )
        ],
      )
    );
  }
  Widget buildImage(){
    final image = NetworkImage(imagePath);

    return ClipOval(
      child:Material(
        color:Colors.transparent,
            child: Ink.image(
              image: image,
              fit: BoxFit.cover,
              width: 128,
              height: 128,
              child: InkWell(onTap: onClicked),
          )
       )
    );
  }
  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
      child:buildCircle(
        color: Colors.blue,
        all: 8,
        child: Icon(
          Icons.edit,
          size: 20,
          color: Colors.white,
        )
      )
    );

  Widget buildCircle ({
    required Widget child,
    required  double all,
    required Color color,
  }) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color ,
      child: child,
      )
  );
}