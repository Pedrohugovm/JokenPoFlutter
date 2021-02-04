import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch( escolhaApp ){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if(
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
    (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
    (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = "Parabéns! Você ganhou!";
      });
    }else if (
    (escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
    (escolhaUsuario == "pedra" && escolhaApp == "papel") ||
    (escolhaUsuario == "papel" && escolhaApp == "tesoura")
    ){
      setState(() {
        this._mensagem = "Que pena, você perdeu!";
      });
    }else {
      setState(() {
        this._mensagem = "Foi um empate!";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ) ,
      body: Center(
        child: Container(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            width: double.infinity,
            child: Column(
              children: <Widget>[
              Text(
                "Escolha do App",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                 ),
                ),
                Image(image: this._imagemApp),
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                ),
                Text(
                  this._mensagem,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                ),
              ),
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset(
                      "images/pedra.png",
                      fit: BoxFit.scaleDown,
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset(
                      "images/papel.png",
                      fit: BoxFit.scaleDown,
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset(
                      "images/tesoura.png",
                      fit: BoxFit.scaleDown,
                      height: 100,
                    ),
                  ),
                ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
