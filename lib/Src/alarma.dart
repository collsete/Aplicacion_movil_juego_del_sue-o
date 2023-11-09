import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ConfigurarAlarma extends StatefulWidget {
  final FlutterLocalNotificationsPlugin notificationsPlugin;

  ConfigurarAlarma({required this.notificationsPlugin});

  @override
  _ConfigurarAlarmaState createState() => _ConfigurarAlarmaState();
}

class _ConfigurarAlarmaState extends State<ConfigurarAlarma> {
  TimeOfDay _time = TimeOfDay.now();
  late tz.Location local;

  @override
  void initState() {
    super.initState();
    // Inicializar la zona horaria local
    tz.initializeTimeZones();
    local = tz.local;
  }

  Future<void> _programarAlarma() async {
    // Obtener la hora seleccionada por el usuario
    final now = DateTime.now();
    final selectedTime = DateTime(now.year, now.month, now.day, _time.hour, _time.minute);

    // Configurar la notificación de la alarma
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('notification_sound'),
    );
    final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await widget.notificationsPlugin.zonedSchedule(
      0,
      'Título de la alarma',
      'Descripción de la alarma',
      tz.TZDateTime.from(selectedTime, local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );

    // Mostrar un mensaje de confirmación al usuario
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Alarma programada para las ${_time.format(context)}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 100, 20, 124),
        title: Text('Configurar alarma'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hora seleccionada: ${_time.format(context)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: _time,
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      _time = value;
                    });
                  }
                });
              },
              child: Text('Seleccionar hora'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _programarAlarma,
              child: Text('Programar alarma'),
            ),
          ],
        ),
      ),
    );
  }
}