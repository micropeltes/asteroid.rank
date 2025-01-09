import 'package:flutter/material.dart';

class NoteDetailPage extends StatelessWidget {
  final double M;
  final double G;
  final double rms;
  final double pertP;
  final double epoch;
  final double H;
  final double numObs;
  final double ref;
  final double lastObs;
  final double comp;
  final double U;
  final double e;
  final double a;
  final double om;
  final double d;
  final double i;
  final double des;
  final double flags;
  final double numOpp;
  final double w;
  final double pertC;
  final double readableDes;

  NoteDetailPage({
    required this.M,
    required this.G,
    required this.rms,
    required this.pertP,
    required this.epoch,
    required this.H,
    required this.numObs,
    required this.ref,
    required this.lastObs,
    required this.comp,
    required this.U,
    required this.e,
    required this.a,
    required this.om,
    required this.d,
    required this.i,
    required this.des,
    required this.flags,
    required this.numOpp,
    required this.w,
    required this.pertC,
    required this.readableDes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asteroid Details',
            style: TextStyle(color: Color(0xFF00FF00))), // Eva Purple color
        backgroundColor: Color(0xFF4B0082),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('M: $M',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('G: $G',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('RMS: $rms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Pert P: $pertP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Epoch: $epoch',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('H: $H',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Number of Observations: $numObs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Reference: $ref',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Last Observation: $lastObs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Comp: $comp',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('U: $U',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('E: $e',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('A: $a',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Om: $om',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('D: $d',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('I: $i',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Des: $des',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Flags: $flags',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Number of Oppositions: $numOpp',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('W: $w',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Pert C: $pertC',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      backgroundColor: Color(0xFF4B0082), // Eva Purple color
    );
  }
}

Widget buildNoteDetailPage(Map<String, dynamic> data, int index) {
  print('Data at index $index: ${data[index]}');
  print('M: ${data[index]['M']} (${data[index]['M'].runtimeType})');
  print('G: ${data[index]['G']} (${data[index]['G'].runtimeType})');
  print('rms: ${data[index]['rms']} (${data[index]['rms'].runtimeType})');
  print(
      'pert_p: ${data[index]['pert_p']} (${data[index]['pert_p'].runtimeType})');
  print('epoch: ${data[index]['epoch']} (${data[index]['epoch'].runtimeType})');
  print('H: ${data[index]['H']} (${data[index]['H'].runtimeType})');
  print(
      'num_obs: ${data[index]['num_obs']} (${data[index]['num_obs'].runtimeType})');
  print('ref: ${data[index]['ref']} (${data[index]['ref'].runtimeType})');
  print(
      'last_obs: ${data[index]['last_obs']} (${data[index]['last_obs'].runtimeType})');
  print('comp: ${data[index]['comp']} (${data[index]['comp'].runtimeType})');
  print('U: ${data[index]['U']} (${data[index]['U'].runtimeType})');
  print('e: ${data[index]['e']} (${data[index]['e'].runtimeType})');
  print('a: ${data[index]['a']} (${data[index]['a'].runtimeType})');
  print('om: ${data[index]['om']} (${data[index]['om'].runtimeType})');
  print('d: ${data[index]['d']} (${data[index]['d'].runtimeType})');
  print('i: ${data[index]['i']} (${data[index]['i'].runtimeType})');
  print('des: ${data[index]['des']} (${data[index]['des'].runtimeType})');
  print('flags: ${data[index]['flags']} (${data[index]['flags'].runtimeType})');
  print(
      'num_opp: ${data[index]['num_opp']} (${data[index]['num_opp'].runtimeType})');
  print('w: ${data[index]['w']} (${data[index]['w'].runtimeType})');
  print(
      'pert_c: ${data[index]['pert_c']} (${data[index]['pert_c'].runtimeType})');
  print(
      'readable_des: ${data[index]['readable_des']} (${data[index]['readable_des'].runtimeType})');

  return NoteDetailPage(
    M: double.tryParse(data[index]['M'].toString()) ?? 0.0,
    G: double.tryParse(data[index]['G']?.toString() ??
            data[index]['readable_des'].toString()) ??
        0.0,
    rms: double.tryParse(data[index]['rms'].toString()) ?? 0.0,
    pertP: double.tryParse(data[index]['pert_p'].toString()) ?? 0.0,
    epoch: double.tryParse(data[index]['epoch'].toString()) ?? 0.0,
    H: double.tryParse(data[index]['H'].toString()) ?? 0.0,
    numObs: double.tryParse(data[index]['num_obs'].toString()) ?? 0.0,
    ref: double.tryParse(data[index]['ref'].toString()) ?? 0.0,
    lastObs: double.tryParse(data[index]['last_obs'].toString()) ?? 0.0,
    comp: double.tryParse(data[index]['comp'].toString()) ?? 0.0,
    U: double.tryParse(data[index]['U'].toString()) ?? 0.0,
    e: double.tryParse(data[index]['e'].toString()) ?? 0.0,
    a: double.tryParse(data[index]['a'].toString()) ?? 0.0,
    om: double.tryParse(data[index]['om'].toString()) ?? 0.0,
    d: double.tryParse(data[index]['d'].toString()) ?? 0.0,
    i: double.tryParse(data[index]['i'].toString()) ?? 0.0,
    des: double.tryParse(data[index]['des'].toString()) ?? 0.0,
    flags: double.tryParse(data[index]['flags'].toString()) ?? 0.0,
    numOpp: double.tryParse(data[index]['num_opp'].toString()) ?? 0.0,
    w: double.tryParse(data[index]['w'].toString()) ?? 0.0,
    pertC: double.tryParse(data[index]['pert_c'].toString()) ?? 0.0,
    readableDes: double.tryParse(data[index]['readable_des'].toString()) ?? 0.0,
  );
}
