import 'package:stockfish/stockfish.dart';

class chess_ai {
  final stockfish = Stockfish();

  Future<void> waitChessAi() async {
    while (stockfish.state.value != StockfishState.ready) {
      await Future.delayed(Duration(seconds: 1));
      print(stockfish.state.value);
    }
  }
}
