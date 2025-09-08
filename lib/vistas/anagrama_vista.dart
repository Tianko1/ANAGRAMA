import 'package:flutter/material.dart';
import '../logica/anagrama_logica.dart';

class AnagramaVista extends StatefulWidget {
  const AnagramaVista({super.key});

  @override
  State<AnagramaVista> createState() => _AnagramaVistaState();
}

class _AnagramaVistaState extends State<AnagramaVista> {
  final _txtFrase1 = TextEditingController();
  final _txtFrase2 = TextEditingController();
  String _resultado = "";

  void _verificar() {
    final f1 = _txtFrase1.text;
    final f2 = _txtFrase2.text;

    final sonAnagramas = AnagramaLogica.sonAnagramas(f1, f2);
    setState(() {
      _resultado =
          sonAnagramas ? "Las frases son anagramas" : "Las frases no son anagramas";
    });
  }

  @override
  void dispose() {
    _txtFrase1.dispose();
    _txtFrase2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verificador de Anagramas"),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ingresa dos frases para verificar",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _txtFrase1,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Primera frase",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _txtFrase2,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Segunda frase",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                     
                    ),
                    onSubmitted: (_) => _verificar(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _verificar,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      child: const Text(
                        "Verificar",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_resultado.isNotEmpty)
                    Text(
                      _resultado,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _resultado.startsWith("✔")
                            ? Colors.green[700]
                            : Colors.red[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
