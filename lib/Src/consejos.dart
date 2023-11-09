import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class consejosScreen extends StatelessWidget {
  final List<String> consejos = [
    '¿Seguro sabes cómo dormir?',
    'Técnicas para poder dormir ',
    '3 tips para dormir',
    'Siete consejos para dormir bien'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consejos en Flutter',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 100, 20, 124),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Consejos en Flutter'),
        ),
        body: ListView.builder(
          itemCount: consejos.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(consejos[index]),
                      content: Container(
                        width: MediaQuery.of(context).size.width * 0.9, // Cambio en esta línea
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: '95yHdyHNPto', // Reemplaza VIDEO_ID con el ID de tu video de YouTube
                                flags: YoutubePlayerFlags(
                                  autoPlay: true,
                                  mute: false,
                                ),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.red,
                              progressColors: ProgressBarColors(
                                playedColor: Colors.red,
                                handleColor: Colors.redAccent,
                              ),
                              onReady: () {
                                // Se ejecuta cuando el reproductor está listo.
                              },
                              onEnded: (data) {
                                // Se ejecuta cuando el video ha terminado de reproducirse.
                              },
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ListTile(
                leading: Icon(Icons.lightbulb_outline),
                title: Text(consejos[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
