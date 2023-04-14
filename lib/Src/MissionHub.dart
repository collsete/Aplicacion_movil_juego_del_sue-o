import 'dart:async';

import 'package:flutter/material.dart';

class MissionHub extends StatefulWidget {
  @override
  _MissionHubState createState() => _MissionHubState();
}

class _MissionHubState extends State<MissionHub> {
  List<Mission> _missions = [
    Mission('Misión 1', 'Descripción de la misión 1', Duration(seconds: 10), 1),
    Mission('Misión 2', 'Descripción de la misión 2', Duration(seconds: 15), 2),
    Mission('Misión 3', 'Descripción de la misión 3', Duration(seconds: 20), 3),
    Mission('Misión 4', 'Descripción de la misión 4', Duration(seconds: 5), 4),
  ];

  late Mission _currentMission;

  @override
  void initState() {
    super.initState();
    _currentMission = _missions[0];
    _startMissionTimer();
  }

  void _startMissionTimer() {
    Timer(_currentMission.duration, () {
      setState(() {
        int currentIndex = _missions.indexOf(_currentMission);
        if (currentIndex < _missions.length - 1) {
          _currentMission = _missions[currentIndex + 1];
        } else {
          _currentMission = _missions[0];
        }
        _startMissionTimer();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            MissionCard(mission: _currentMission),
            SizedBox(height: 16.0),
            Text('Otras misiones'),
            Expanded(
              child: ListView.builder(
                itemCount: _missions.length,
                itemBuilder: (BuildContext context, int index) {
                  return MissionListItem(mission: _missions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Mission {
  final String name;
  final String description;
  final Duration duration;
  final int reward;

  Mission(this.name, this.description, this.duration, this.reward);
}

class MissionCard extends StatefulWidget {
  final Mission mission;

  MissionCard({required this.mission});

  @override
  _MissionCardState createState() => _MissionCardState();
}

class _MissionCardState extends State<MissionCard> {
  late Timer _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.mission.duration;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -= Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.mission.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.mission.description),
            SizedBox(height: 8.0),
            Text('Tiempo restante: ${_remainingTime.inSeconds} segundos'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.monetization_on,
                size: 16.0),
                SizedBox(width: 4.0),
                Text('${widget.mission.reward} monedas doradas'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

  class MissionListItem extends StatelessWidget {
  final Mission mission;

  MissionListItem({required this.mission});

        @override
        Widget build(BuildContext context) {
        return ListTile(
        title: Text(mission.name),
        subtitle: Text(mission.description),
        trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Icon(Icons.monetization_on, size: 16.0,color: Colors.amber),
        SizedBox(height: 4.0),
        Text('${mission.reward} monedas doradas'),
        ],
      ),
    );
  }
}