import 'package:ejemplo_disenos_firebase/widgets/cambio_size_animation.dart';
import 'package:ejemplo_disenos_firebase/widgets/opacity_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextfieldWidget extends StatelessWidget {
  final IconData icono;
  final bool iconoIzquida;
  final Color colorGradienteIconoInicio;
  final Color colorGradienteIconoFin;
  final String hindText;
  final double hintTextSize;
  final TextAlign alineacionTexto;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final bool enableInteractiveSelection;
  final Function? onTapTextfield;
  final Function? onTapIcono;
  final Function? onChanged;
  final double alto;
  final FormFieldValidator<String>? validator;
  const TextfieldWidget({
    this.icono = Icons.ac_unit,
    this.iconoIzquida = false,
    this.alineacionTexto = TextAlign.start,
    Color? colorGradienteIconoInicio,
    this.hindText = '',
    Color? colorGradienteIconoFin,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.controller,
    this.enableInteractiveSelection = true,
    this.onTapTextfield,
    this.onTapIcono,
    this.onChanged,
    this.hintTextSize = 22,
    this.alto = 60,
    this.validator,
  })  : this.colorGradienteIconoInicio =
            colorGradienteIconoInicio ?? const Color(0xffFFB239),
        this.colorGradienteIconoFin =
            colorGradienteIconoFin ?? const Color(0xffE79E33);

  @override
  Widget build(BuildContext contextText) {
    return Container(
      height: this.alto,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: this.colorGradienteIconoInicio,
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(colors: <Color>[
          this.colorGradienteIconoFin,
          this.colorGradienteIconoInicio.withOpacity(0.9),
        ], stops: [
          0.8,
          1.0
        ]),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(2, 3),
              spreadRadius: 2)
        ],
      ),
      child: Row(
        children: <Widget>[
          if (this.iconoIzquida)
            _IconoTextfield(
              icono: this.icono,
              onTap: this.onTapIcono,
            ),
          Expanded(
            child: _CampoTexto(
              validator: this.validator,
              hindText: this.hindText,
              alineacionTexto: this.alineacionTexto,
              obscureText: this.obscureText,
              textInputType: this.textInputType,
              controller: this.controller,
              enableInteractiveSelection: this.enableInteractiveSelection,
              onTap: () => this.onTapTextfield,
              onChanged: () => this.onChanged,
              hintTextSize: this.hintTextSize,
            ),
          ),
          if (!this.iconoIzquida)
            _IconoTextfield(
              icono: this.icono,
              onTap: this.onTapIcono,
            ),
        ],
      ),
    );
  }
}

class _IconoTextfield extends StatelessWidget {
  const _IconoTextfield({
    required this.icono,
    this.onTap,
  });

  final IconData icono;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return CambioSizeAnimation(
      sizeFinal: 40,
      sizeIniciar: 0,
      child: GestureDetector(
        child: Container(
          width: 40,
          alignment: Alignment.center,
          child: OpacityAnimation(
            duration: Duration(milliseconds: 1300),
            child: FaIcon(
              this.icono,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () => this.onTap,
      ),
    );
  }
}

class _CampoTexto extends StatelessWidget {
  const _CampoTexto({
    required this.hindText,
    required this.alineacionTexto,
    required this.obscureText,
    required this.textInputType,
    this.controller,
    this.enableInteractiveSelection,
    this.onTap,
    this.onChanged,
    this.hintTextSize,
    this.validator,
  });

  final String hindText;
  final double? hintTextSize;
  final TextAlign alineacionTexto;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final bool? enableInteractiveSelection;
  final Function? onTap;
  final Function? onChanged;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 0, color: Colors.white),
        ),
        padding: EdgeInsets.all(0),
        child: TextFormField(
          validator: this.validator,
          keyboardType: this.textInputType,
          obscureText: this.obscureText,
          textAlign: this.alineacionTexto,
          controller: this.controller,
          style: TextStyle(
            fontSize: 22,
          ),
          decoration: new InputDecoration(
            hintText: this.hindText,
            hintStyle: TextStyle(
                fontSize: this.hintTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: this.alineacionTexto == TextAlign.start ? 15 : 0),
          ),
          onTap: () => this.onTap,
          onChanged: (value) => this.onChanged,
        ));
  }
}
