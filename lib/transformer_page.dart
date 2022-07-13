import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransformerPage extends StatelessWidget {
  const TransformerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container()
        // TransformerPageView(
        //     loop: true,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Container(
        //         child: Center(
        //           child: Text(
        //             'test',
        //             style: TextStyle(fontSize: 80.0, color: Colors.white),
        //           ),
        //         ),
        //       );
        //     },
        //     itemCount: 3)
        );
  }
}
