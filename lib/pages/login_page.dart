import 'package:ejemplo_disenos_firebase/providers/provider/login_provider.dart';
import 'package:ejemplo_disenos_firebase/utils/reg_exp_utils.dart';
import 'package:ejemplo_disenos_firebase/widgets/button_widget.dart';
import 'package:ejemplo_disenos_firebase/widgets/fondo_login_widget.dart';
import 'package:ejemplo_disenos_firebase/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            FondoLoginWidget(),
            Container(
              height: size.height * 0.45,
              child: Column(
                children: [
                  _Titulo(anchoMaximo: size.width * 0.9),
                  ChangeNotifierProvider(
                      create: (_) => LoginProvider(), child: _Formulario())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  final double anchoMaximo;

  const _Titulo({required this.anchoMaximo});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: anchoMaximo * 95 / 100,
      alignment: Alignment.centerRight,
      child: Text(
        'Ingresar',
        style: TextStyle(
          fontSize: size.height * 0.05,
          color: Colors.pink,
        ),
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color colorPrimarioUno = Color(0xffFFB239);
    final Color colorPrimarioDos = Color(0xffC95363);
    final loginForm = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextfieldWidget(
                textInputType: TextInputType.emailAddress,
                validator: (value) => RegExpUtils.validaEmail(value)
                    ? null
                    : 'El valor ingresado no corresponde a un correo valido',
                onChanged: (value) => loginForm.password = value,
                iconoIzquida: true,
                colorGradienteIconoInicio: colorPrimarioUno,
                colorGradienteIconoFin: Color(0xffE79E33),
                alto: size.height * 0.07,
                icono: Icons.email,
                hindText: 'Email'),
            TextfieldWidget(
              validator: (value) =>
                  RegExpUtils.validaPassword(NivelSeguridadPassword.bajo, value)
                      ? null
                      : 'La contraseña debe de ser de 6 caracteres',
              onChanged: (value) => loginForm.email = value,
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
              colorGradienteIconoInicio: colorPrimarioDos,
              colorGradienteIconoFin: Color(0xffDE596C),
              alto: size.height * 0.07,
              icono: Icons.lock,
              hindText: 'Contraseña',
            ),
            ButtonWidget(
                widget: Text('Ingresar'),
                ancho: size.width * 0.6,
                alto: size.height * 0.06,
                utilizaGradiente: true,
                colorGradienteInicio:
                    loginForm.isLoading ? Colors.blueGrey : colorPrimarioUno,
                colorGradienteFinal:
                    loginForm.isLoading ? Colors.blueGrey : colorPrimarioDos,
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(Duration(seconds: 2));

                        // TODO: validar si el login es correcto
                        loginForm.isLoading = false;
                      })
          ],
        ),
      ),
    );
  }
}
