import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final TextOverflow textOverflow;

  const ModifiedText({Key key, this.text, this.color, this.size, this.textOverflow})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
        text, overflow: textOverflow ?? TextOverflow.ellipsis,
        style: GoogleFonts.roboto(
            color: color, fontSize: size));
  }
}