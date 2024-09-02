import 'package:flutter/material.dart';

class CustomContainerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomContainerButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.grey.shade500,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 30),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 19, color: Colors.orange[800]),
              ),
              Spacer(),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.add,size: 30,),color: Colors.orange[800],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
