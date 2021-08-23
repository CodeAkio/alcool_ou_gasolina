import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _alcoolController = TextEditingController();
  var _gasolinaController = TextEditingController();
  var _textoResultado = "";

  void _calcular() {
    var precoAlcool = double.tryParse(_alcoolController.text);
    var precoGasolina = double.tryParse(_gasolinaController.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        this._textoResultado =
            "Número inválido! Digite números maiores que 0 e utilizando(.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          this._textoResultado = "É melhor abastecer com Gasolina";
        });
      } else {
        setState(() {
          this._textoResultado = "É melhor abastecer com Álcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset("assets/images/logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _alcoolController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina, ex: 3.59"),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _gasolinaController,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        primary: Colors.blue,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    child: Text("Calcular"),
                    onPressed: _calcular,
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
