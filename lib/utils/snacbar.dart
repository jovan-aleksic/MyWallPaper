import 'package:flutter/material.dart';

void openSnackbar(BuildContext context, snacMessage){
  final snackBar = SnackBar(
    content: Container(
      alignment: Alignment.centerLeft,
      height: 60,
      child: Text(
        snacMessage,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    ),
    action: SnackBarAction(
      label: 'Ok',
      textColor: Colors.blueAccent,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


void openDownloadingSnackbar(BuildContext context, snacMessage){
  final snackBar = SnackBar(
    content: Container(
      alignment: Alignment.centerLeft,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const CircularProgressIndicator(),
          const SizedBox(width: 15,),
          Text(snacMessage,style: const TextStyle(fontSize: 14,)),
          
        ],
      )
    ),
    
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  
}