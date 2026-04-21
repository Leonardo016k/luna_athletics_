import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  const MenuItem({
    super.key,
    required this.text,
    required this.icon,
    this.isActive = false,
    required this.onPressed,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    bool isHover = false;

    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      color: isHover 
        ? Colors.white.withAlpha(150)
        : widget.isActive ? Colors.white.withAlpha(100) : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : ()=> widget.onPressed(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: MouseRegion(
              onEnter: (_)=>setState(() {
               isHover=true; 
              }),
              onExit: (_)=>setState(() {
               isHover=false; 
              }),
              child: Row(
                children: [
                  Icon(widget.icon,color: Colors.white.withAlpha(100)),
                  SizedBox(height: 10),
                  Text(widget.text,style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white.withAlpha(150)
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
