import 'package:flutter/material.dart';
import 'package:flutter/src/semantics/semantics.dart';
import 'dart:ui';
import 'dart:core';

void main() => runApp(MyApp());

connect g = connect();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyBus',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String CPF, senha;
  //connect g = connect();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cpfField = TextField(
      controller: _controller1,
      obscureText: false,
      style: style,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "CPF",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: _controller2,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Senha",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd32f2f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (g.login(_controller1.text, _controller2.text)) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
            );
          } else {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Credenciais Invalidas"),
                );
              },
            );
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final createAccButton = Material(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        child: Text("Criar conta",
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateAcc()),
          );
        },
      ),
    );

    final forgotPassButton = Material(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        //color: Color(0xffffffff),
        child: Text("Esqueceu sua senha?",
            textAlign: TextAlign.center,
            style: style.copyWith(color: Colors.grey[600])),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPassMenu()),
          );
        },
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                cpfField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 15.0,
                ),
                createAccButton,
                SizedBox(
                  height: 80.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                forgotPassButton,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class CreateAcc extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final cpfField = TextField(
      obscureText: false,
      style: style,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "CPF",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Senha",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final createAccButton = Material(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Text("Criar conta",
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
      ),
    );

    final loginButtonAlt = Material(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Text("Já tem conta? Entrar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.grey, fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Criar Conta"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    cpfField,
                    SizedBox(height: 25.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 50.0,
                    ),
                    createAccButton,
                    SizedBox(
                      height: 15.0,
                    ),
                    loginButtonAlt,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ForgotPassMenu extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: _controller,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final sendButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd32f2f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (g.verificaEmail(_controller.text)) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Email enviado"),
                );
              },
            );
          } else {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Email inválido"),
                );
              },
            );
          }
        },
        child: Text("Enviar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Recuperar Senha"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Digite seu email cadastrado',
                      style: TextStyle(
                          //color: Colors.black[800],
                          //fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          //fontFamily: 'Open Sans',
                          fontSize: 20),
                    ),
                    SizedBox(height: 25.0),
                    emailField,
                    SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    sendButton,
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Se cadastrado, um email será enviado ao endereço fornecido. Siga as instruções do email, se o problema persistir, contate o suporte ao cliente.',
                      style: TextStyle(
                          //color: Colors.black[800],
                          //fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          //fontFamily: 'Open Sans',
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class MainMenu extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    // connect g = connect();
    final quitButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xFFFFFFFF),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(3.0, 10.0, 3.0, 10.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: Text("Sair",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.red[600], fontWeight: FontWeight.bold)),
      ),
    );

    final payButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd32f2f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 60.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PayMenu()),
          );
        },
        child: Text("Pagar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final rechargeButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd6d6d6),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RechargeMenu()),
          );
        },
        child: Text("Recarregar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Não é PESSOA?',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w900,
                      //fontStyle: FontStyle.italic,
                      //fontFamily: 'Open Sans',
                      fontSize: 20),
                ),
                SizedBox(
                  height: 0.0,
                ),
                quitButton,
                SizedBox(
                  height: 70.0,
                ),
                payButton,
                SizedBox(
                  height: 90.0,
                ),
                Text(
                  'Saldo atual:     R\$' + g.saldo.toStringAsFixed(2),
                  style: TextStyle(
                      color: Colors.red[600],
                      fontWeight: FontWeight.w900,
                      //fontStyle: FontStyle.italic,
                      //fontFamily: 'Open Sans',
                      fontSize: 20),
                ),
                SizedBox(
                  height: 15.0,
                ),
                rechargeButton,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class PayMenu extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pagar"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60.0,
                    ),
                    Text(
                      'Apresente o QR Code ao leitor',
                      style: TextStyle(
                          //color: Colors.black[800],
                          //fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          //fontFamily: 'Open Sans',
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 120.0,
                    ),
                    SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "assets/qrcode2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class RechargeMenu extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final presencialButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd32f2f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RechargePresencialMenu()),
          );
        },
        child: Text("Presencial",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final giftCardButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd32f2f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RechargeGiftCardMenu()),
          );
        },
        child: Text("Gift Card",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final creditCardButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd32f2f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        onPressed: () {},
        child: Text("Cartão de Crédito",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final pixButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd32f2f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        onPressed: () {},
        child: Text("PIX",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Recarregar"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    presencialButton,
                    SizedBox(
                      height: 20.0,
                    ),
                    giftCardButton,
                    SizedBox(
                      height: 20.0,
                    ),
                    creditCardButton,
                    SizedBox(
                      height: 20.0,
                    ),
                    pixButton,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class RechargePresencialMenu extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recarregar"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Apresente o QR Code ao leitor',
                      style: TextStyle(
                          //color: Colors.black[800],
                          //fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          //fontFamily: 'Open Sans',
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "assets/qrcode2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      'OU',
                      style: TextStyle(
                          //color: Colors.black[800],
                          fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          //fontFamily: 'Open Sans',
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      'Digite o código abaixo',
                      style: TextStyle(
                          //color: Colors.black[800],
                          //fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          //fontFamily: 'Open Sans',
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'COD-000-000-000',
                      style: TextStyle(
                          color: Colors.red[800],
                          //fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          //fontFamily: 'Open Sans',
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class RechargeGiftCardMenu extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final TextEditingController _controller = TextEditingController();
  // connect g = connect();

  @override
  Widget build(BuildContext context) {
    final codeField = TextField(
      controller: _controller,
      obscureText: false,
      style: style,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "XXXX-XXXX-XXXX",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final redeemButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffd32f2f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (g.verificaGift1(_controller.text)) {
            g.adicionarSaldo(15);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
            );
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("R\$ 15,00 de Saldo adicionado"),
                );
              },
            );
          } else if (g.verificaGift2(_controller.text)) {
            g.adicionarSaldo(30);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
            );
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("R\$ 30,00 de Saldo adicionado"),
                );
              },
            );
          } else if (g.verificaGift3(_controller.text)) {
            g.adicionarSaldo(50);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
            );
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("R\$ 50,00 de Saldo adicionado"),
                );
              },
            );
          } else {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Código Inválido"),
                );
              },
            );
          }
        },
        child: Text("Resgatar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Recarregar"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Digite o código do Gift Card',
                      style: TextStyle(
                          //color: Colors.black[800],
                          //fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          //fontFamily: 'Open Sans',
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(height: 50.0),
                    codeField,
                    SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    redeemButton,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class connect {
  double saldo = 0.00;
  String cpf = "12345678910";
  String senha = "123";
  String gift1 = "BHNM38442317";
  String gift2 = "BHN1T498NJX0";
  String gift3 = "BHNM79517836";
  double preco = 35.00;
  String email = "pessoa@email.com";

  void pagar(double valor) {
    this.saldo = this.saldo - valor;
  }

  bool login(String login, String senha) {
    if (login == this.cpf && senha == this.senha) return true;
    return false;
  }

  bool verificaGift1(String gift) {
    if (this.gift1 == gift) return true;
    return false;
  }

  bool verificaGift2(String gift) {
    if (this.gift2 == gift) return true;
    return false;
  }

  bool verificaGift3(String gift) {
    if (this.gift3 == gift) return true;
    return false;
  }

  void adicionarSaldo(double valor) {
    this.saldo += valor;
  }

  bool verificaEmail(String email) {
    if (this.email == email) return true;
    return false;
  }
}
