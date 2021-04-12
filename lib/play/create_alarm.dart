import 'package:flutter/material.dart';
import '../components/views.dart';

class CreateAlarmScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateAlarmState();
  }
}

class CreateAlarmState extends State<CreateAlarmScreen> {
  final days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  var selectedDays = Set();
  var _selectedtime = TimeOfDay.now();

  Widget _buildDayButton(String day) {
    final isSelected = selectedDays.contains(day);
    return CircleButton(
      color: isSelected ? Colors.teal : Colors.grey,
      text: day,
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedDays.remove(day);
          } else {
            selectedDays.add(day);
          }
        });
      },
    );
  }

  _buildDayRows() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: days.map((day) => _buildDayButton(day)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              child: Text(this._selectedtime.format(context)),
              onPressed: () async {
                final time = await showTimePicker(context: context, initialTime: this._selectedtime);
                setState(() {
                  this._selectedtime = time;
                });
              },
            ),
          ),
          _buildDayRows(),
          ElevatedButton(
            child: Text("CREATE"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
