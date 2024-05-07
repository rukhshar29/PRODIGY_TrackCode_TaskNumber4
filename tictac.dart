import 'package:flutter/material.dart';

class Tictacc extends StatefulWidget {
  const Tictacc({super.key});

  @override
  State<Tictacc> createState() => _TictaccState();
}

class _TictaccState extends State<Tictacc> {
    List<String> _board = ['', '', '', '', '', '', '', '', ''];
  String _currentPlayer = 'X';
  bool _gameEnded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 180, 180),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Tic Tac Toe',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.deepOrange ),),
      ),
      body: Column(
        
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (_board[index] == '' && !_gameEnded) {
                      setState(() {
                        _board[index] = _currentPlayer;
                        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
                        _checkForWin();
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        _board[index],
                        style: TextStyle(fontSize: 30,color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            _gameEnded ? 'Game Over' : 'Player $_currentPlayer\'s turn',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.cyan ),
            onPressed: () {
              setState(() {
                _board = ['', '', '', '', '', '', '', '', ''];
                _currentPlayer = 'X';
                _gameEnded = false;
              });
            },
            child: Text('Reset',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black ),),
          ),
        ],
      ),
   
    );
  }
   void _checkForWin() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (_board[i * 3] != '' &&
          _board[i * 3] == _board[i * 3 + 1] &&
          _board[i * 3] == _board[i * 3 + 2]) {
        _gameEnded = true;
        return;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_board[i] != '' &&
          _board[i] == _board[i + 3] &&
          _board[i] == _board[i + 6]) {
        _gameEnded = true;
        return;
      }
    }

    // Check diagonals
    if (_board[0] != '' &&
        _board[0] == _board[4] &&
        _board[0] == _board[8]) {
      _gameEnded = true;
      return;
    }
    if (_board[2] != '' &&
        _board[2] == _board[4] &&
        _board[2] == _board[6]) {
      _gameEnded = true;
      return;
    }

    // Check for draw
    if (!_board.contains('')) {
      _gameEnded = true;
      return;
    }
  }

}