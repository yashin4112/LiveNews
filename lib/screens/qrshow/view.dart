import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';

class QRShowView extends StatelessWidget {
  final String data;
  final String title;
  const QRShowView({ Key? key, required this.data, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text('Share'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Scan The QR',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: PrettyQr(
              size: 200,
              data: data,
              errorCorrectLevel: QrErrorCorrectLevel.M,
              roundEdges: true,
            ),
          ),
          SizedBox(height: 40,),
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.symmetric(horizontal: 15),
          //   child: ElevatedButton(
          //     onPressed: (){
          //       Share.share(data);
          //     }, 
          //     child: Text('Share'),
          //     style: ButtonStyle(
          //       shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          //     ),
          //   ),
          // )
        ],
      )
      
    );
  }
}