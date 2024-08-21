import 'dart:math';
import 'package:flutter/material.dart';

class JokenPo extends StatefulWidget {
  @override
  JokenPoState createState() => JokenPoState();
}

class JokenPoState extends State<JokenPo> {
  final String defaultImage = 'assets/images/default.png';
  final String rockImage = 'assets/images/rock.png';
  final String paperImage = 'assets/images/paper.png';
  final String scissorsImage = 'assets/images/scissors.png';

  final List<String> choices = ['rock', 'paper', 'scissors'];
  String appChoice = 'default';
  String resultMessage = 'Escolha uma opção abaixo';

  String _getImage(String choice) {
    switch (choice) {
      case 'rock':
        return rockImage;
      case 'paper':
        return paperImage;
      case 'scissors':
        return scissorsImage;
      default:
        return defaultImage;
    }
  }

  void _play(String userChoice) {
    final int appIndex = Random().nextInt(3);
    final String appChoice = choices[appIndex];

    setState(() {
      this.appChoice = appChoice;
      resultMessage = _getResult(userChoice, appChoice);
    });
  }

  String _getResult(String userChoice, String appChoice) {
    if (userChoice == appChoice) {
      return 'Empate!';
    } else if ((userChoice == 'rock' && appChoice == 'scissors') ||
        (userChoice == 'paper' && appChoice == 'rock') ||
        (userChoice == 'scissors' && appChoice == 'paper')) {
      return 'Você venceu!';
    } else {
      return 'Você perdeu!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Escolha do App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Image.asset(_getImage(appChoice), height: 100),
          const SizedBox(height: 20),
          Text(
            resultMessage,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Escolha uma opção abaixo',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _play('rock'),
                child: Image.asset(rockImage, height: 80),
              ),
              GestureDetector(
                onTap: () => _play('paper'),
                child: Image.asset(paperImage, height: 80),
              ),
              GestureDetector(
                onTap: () => _play('scissors'),
                child: Image.asset(scissorsImage, height: 80),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
