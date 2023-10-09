import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess Demo'),
      ),
      drawer: Drawer(
                child: ListView(
          children: const [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.yellowAccent),
                child: Text("My Home Page")),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ChessBoard(
                controller: controller,
                // 盤面の色
                boardColor: BoardColor.orange,
                // 盤面に矢印が表示される。メカニズムの仕組みを理解するにはチェスの基本的な知識が必要
                arrows: [
                  BoardArrow(
                    from: 'd2',
                    to: 'd4',
                    //color: Colors.red.withOpacity(0.5),
                  ),
                  BoardArrow(
                    from: 'e7',
                    to: 'e5',
                    color: Colors.red.withOpacity(0.7),
                  ),
                ],
                // プレイヤーの色をここで表示する
                boardOrientation: PlayerColor.white,
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Chess>(
              valueListenable: controller,
              builder: (context, game, _) {
                return Text(
                  controller.getSan().fold(
                        '',
                        (previousValue, element) =>
                            '${previousValue} \n' + (element ?? ''),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}