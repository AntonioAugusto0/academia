import 'package:flutter/material.dart';


class Homescreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Fitness App'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDashboardItem(
                context,
                title: "Treinos da semana",
                subtitle: "00:00",
                icon: Icons.timer,
              ),
              SizedBox(height: 10),
              _buildDashboardItem(
                context,
                title: "Refeição",
                subtitle: "Entrar",
                icon: Icons.restaurant,
              ),
              SizedBox(height: 10),
              _buildDashboardItem(
                context,
                title: "Tempo de sono",
                subtitle: "0 h 00 min",
                icon: Icons.bed,
                additionalInfo: "00:00 - 00:00",
              ),
              SizedBox(height: 10),
              _buildDashboardItem(
                context,
                title: "Composição corporal",
                subtitle: "Entrar",
                icon: Icons.fitness_center,
                additionalWidget: _buildBodyCompositionIndicator(),
              ),
              SizedBox(height: 10),
              _buildDashboardItem(
                context,
                title: "Água",
                subtitle: "+ 250 ml",
                icon: Icons.local_drink,
              ),
              SizedBox(height: 10),
              _buildStepsCounter(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Together'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Boa forma'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Minha página'),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      String? additionalInfo,
      Widget? additionalWidget}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  if (additionalInfo != null)
                    Text(
                      additionalInfo,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              if (additionalWidget != null) additionalWidget,
              SizedBox(width: 10),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBodyCompositionIndicator() {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepsCounter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.directions_walk, color: Colors.green),
              SizedBox(width: 10),
              Text(
                "0 passos",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "0 min",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Text(
                "0 Cal",
                style: TextStyle(color: Colors.pink, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

