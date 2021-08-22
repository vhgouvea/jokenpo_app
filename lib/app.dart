import 'package:flutter/material.dart';
import 'dart:math';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var mensagem = "Escolha uma opção abaixo:";
  var mensagemVencedora = "Aguardando escolhas....";
  var escolhaComputador = AssetImage("imagens/padrao.png");
  var imagemUsuario = AssetImage("imagens/padrao.png");

  void selecionaOpcao(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaComputador = opcoes[numero];

    if (escolhaComputador == "pedra") {
      setState(() {
        this.escolhaComputador = AssetImage("imagens/pedra.png");
      });
    } else if (escolhaComputador == "papel") {
      setState(() {
        this.escolhaComputador = AssetImage("imagens/papel.png");
      });
    } else
      setState(() {
        this.escolhaComputador = AssetImage("imagens/tesoura.png");
      });

    if (escolhaUsuario == "pedra") {
      setState(() {
        this.imagemUsuario = AssetImage("imagens/pedra.png");
      });
    } else if (escolhaUsuario == "papel") {
      setState(() {
        this.imagemUsuario = AssetImage("imagens/papel.png");
      });
    } else
      setState(() {
        this.imagemUsuario = AssetImage("imagens/tesoura.png");
      });

    if ((escolhaUsuario == "pedra" && escolhaComputador == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaComputador == "papel") ||
        (escolhaUsuario == "papel" && escolhaComputador == "pedra")) {
      setState(() {
        this.mensagemVencedora = "PARABÉNS! VOCÊ GANHOU!";
      });
    } else if ((escolhaComputador == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaComputador == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaComputador == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this.mensagemVencedora = "QUE PENA! VOCÊ PERDEU :(";
      });
    } else {
      setState(() {
        this.mensagemVencedora = "EMPATAMOS....";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "JOKENPÔ",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this.mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => selecionaOpcao("pedra"),
                child: Image.asset(
                  "imagens/pedra.png",
                  height: 150,
                ),
              ),
              GestureDetector(
                  onTap: () => selecionaOpcao("papel"),
                  child: Image.asset(
                    "imagens/papel.png",
                    height: 150,
                  )),
              GestureDetector(
                  onTap: () => selecionaOpcao("tesoura"),
                  child: Image.asset(
                    "imagens/tesoura.png",
                    height: 150,
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700),
            ),
          ),
          Image(
            image: this.escolhaComputador,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Sua Escolha:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700),
            ),
          ),
          Image(
            image: this.imagemUsuario,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this.mensagemVencedora,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade900),
            ),
          ),
        ],
      ),
    );
  }
}
