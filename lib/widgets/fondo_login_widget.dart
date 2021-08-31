import 'package:flutter/material.dart';

class FondoLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: _HeaderPaiterLogin(),
      ),
    );
  }
}

class _HeaderPaiterLogin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _crearfiguraColorSuperor(canvas, size);
    _crearfiguraColorInferior(canvas, size);
    _crearFiguraBlancaConSombraSuperior(canvas, size);
    _crearFiguraBlancaConSombraInferior(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _crearfiguraColorSuperor(Canvas canvas, Size size) {
    final Color colorPrimarioUno = Color(0xffFFB239);
    final Color colorPrimarioUnoGradiente = Color(0xffE79E33);

    final Color colorPrimarioDos = Color(0xffC95363);
    final Color colorPrimarioDosGradiente = Color(0xffDE596C);
    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0, 150.0), radius: 180);
    //Gradiente rosado
    final Gradient gradiente = new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          colorPrimarioDos.withOpacity(0.9),
          colorPrimarioDosGradiente,
          colorPrimarioUno,
          colorPrimarioUnoGradiente
        ],
        stops: [
          0.2,
          0.5,
          0.8,
          0.9
        ]);
    final paint = new Paint()..shader = gradiente.createShader(rect);

    //Propiedades
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujo
    //
    path.moveTo(0, size.height * 0.4);
    path.lineTo(size.width * 0.17, size.height * 0.52);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * 0.3, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  void _crearfiguraColorInferior(Canvas canvas, Size size) {
    final Color colorPrimarioUno = Color(0xffFFB239);
    final Color colorPrimarioUnoGradiente = Color(0xffE79E33);

    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0, 150.0), radius: 180);
    //Gradiente rosado
    final Gradient gradiente = new LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [colorPrimarioUno, colorPrimarioUnoGradiente]);
    final paint = new Paint()..shader = gradiente.createShader(rect);

    //Propiedades
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.moveTo(size.width * 0.7, size.height);
    path.quadraticBezierTo(size.width * 0.92, size.height * 0.85,
        size.width * 0.8, size.height * 0.72);
    path.lineTo(size.width, size.height * 0.81);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  void _crearFiguraBlancaConSombraSuperior(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.moveTo(size.width * 0.17, size.height * 0.52);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * 0.3, size.width, size.height * 0.2);
    path.lineTo(size.width, size.height * 0.24);
    path.lineTo(size.width * 0.17, size.height * 0.54);
    canvas.drawShadow(
        path.shift(Offset(0, -37)), Colors.black.withOpacity(0.6), 15.0, true);

    canvas.drawPath(path, paint);
  }

  void _crearFiguraBlancaConSombraInferior(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.moveTo(size.width * 0.7, size.height);
    path.quadraticBezierTo(size.width * 0.92, size.height * 0.85,
        size.width * 0.8, size.height * 0.72);
    path.lineTo(size.width * 0.78, size.height * 0.72);
    path.lineTo(size.width * 0.6, size.height);
    canvas.drawShadow(
        path.shift(Offset(20, 0)), Colors.black.withOpacity(0.6), 15.0, true);

    canvas.drawPath(path, paint);
  }
}
