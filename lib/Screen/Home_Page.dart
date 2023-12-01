
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // AudioPlayer _audioPlayer = AudioPlayer();
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  List<String> activities = [
    'Wake up',
    'Go to gym',
    'Breakfast',
    'Meetings',
    'Lunch',
    'Quick nap',
    'Go to library',
    'Dinner',
    'Go to sleep',
  ];

  String selectedDay = 'Monday';
  String selectedTime = '00:00';
  String selectedActivity = 'Wake up';
  late bool isPlaying;
  bool isOn = false;
  int alarmId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: const Text(
          'Reminder App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.black45],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amber, width: 2)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        value: selectedDay,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDay = newValue!;
                          });
                        },
                        items: daysOfWeek.map((String day) {
                          return DropdownMenuItem<String>(
                            value: day,
                            child: Text(day),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amber, width: 2)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        value: selectedTime,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTime = newValue!;
                          });
                        },
                        items: List.generate(24, (index) {
                          String hour = (index < 10) ? '0$index' : '$index';
                          return DropdownMenuItem<String>(
                            value: '$hour:00',
                            child: Text('$hour:00'),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amber, width: 2)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        value: selectedActivity,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedActivity = newValue!;
                          });
                        },
                        items: activities.map((String activity) {
                          return DropdownMenuItem<String>(
                            value: activity,
                            child: Text(activity),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        // border:Border.all()
                      )),
                  onPressed: () {
                    _setReminder();
                  },
                  child: const Text(
                    'Set Reminder',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 20,),
              Center(child: Text('Reminder for $selectedDay at $selectedTime: $selectedActivity'))
            ],
          ),
        ),
      ),
    );
  }

  void fireAlarm() {
    print('Alarm Fired at $selectedTime');
  }

  void _setReminder() {
    // Logic to set the reminder goes here
    // You may want to use a package like `timezone` for handling time zones
    // For simplicity, we'll just print a reminder message for now
    String reminderMessage =
        'Reminder for $selectedDay at $selectedTime: $selectedActivity';
    print(reminderMessage);

    // Play a sound or chime
    // _playSound();
  }

  void _playSound() async {
    final _audioPlayer = AudioPlayer();
    // await _audioPlayer.play(UrlSource('images/ringtone.mp3'));

    if (isPlaying) {
      // success
      await _audioPlayer.play(UrlSource('images/ringtone.mp3'));
      print('Sound played successfully');
    } else {
      await _audioPlayer.pause();
      print('Error playing sound');
    }
  }
}
