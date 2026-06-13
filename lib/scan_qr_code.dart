import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  TextEditingController urlController = TextEditingController();
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data.isNotEmpty)
                QrImageView(
                  data: data,
                  size: 200,
                ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: 'Enter your data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Enter your data',
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    data = urlController.text;
                  });
                },
                child: const Text('Generate QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






















// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// class GenerateQRCode extends StatefulWidget {
//   const GenerateQRCode({super.key});
//
//   @override
//   State<GenerateQRCode> createState() => _GenerateQRCodeState();
// }
//
// class _GenerateQRCodeState extends State<GenerateQRCode> {
//   String qrResult = 'Scanner Data will appear here';
//   Future<void>scanQR()async{
//     try{
//       final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
//       if(!mounted)return;
//       setState(() {
//         this.qrResult = qrCode.toString();
//       });
//     } on PlatformException{
//       qrResult = 'Fail to read QR Code';
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Scanner'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 30,),
//             Text('$qrResult', style: TextStyle(color: Colors.black),),
//             SizedBox(height: 30,),
//             ElevatedButton(onPressed: (){}, child: Text('Scan Code'))
//           ],
//         ),
//       ),
//     );
//   }
// }
