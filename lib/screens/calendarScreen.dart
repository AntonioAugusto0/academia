import 'package:flutter/material.dart';
import 'dart:convert';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final response = await http.get(Uri.parse('https://api.exemplo.com/events'));

    if (response.statusCode == 200) {
      setState(() {
        events = json.decode(response.body);
      });
    } else {
      throw Exception('Falha ao carregar os eventos');
    }
  }

  Future<void> createEvent(String title, DateTime date) async {
    final response = await http.post(
      Uri.parse('https://api.exemplo.com/events'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'date': date.toIso8601String(),
      }),
    );

    if (response.statusCode == 201) {
      fetchEvents();
    } else {
      throw Exception('Falha ao criar o evento');
    }
  }

  Future<void> deleteEvent(int id) async {
    final response = await http.delete(
      Uri.parse('https://api.exemplo.com/events/$id'),
    );

    if (response.statusCode == 200) {
      fetchEvents();
    } else {
      throw Exception('Falha ao deletar o evento');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(events[index]['title']),
            subtitle: Text(events[index]['date']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteEvent(events[index]['id']);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await createEvent('Novo Evento', DateTime.now());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
