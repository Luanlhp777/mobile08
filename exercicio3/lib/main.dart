import 'package:flutter/material.dart';

// Ponto de entrada do aplicativo
void main() {
  runApp(const MainApp());
}

// Aplicação principal
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaEstatisticas(),
    );
  }
}

// ---------- TELA ESTATÍSTICAS ----------

class TelaEstatisticas extends StatefulWidget {
  const TelaEstatisticas({super.key});

  @override
  State<TelaEstatisticas> createState() => _TelaEstatisticasState();
}

class _TelaEstatisticasState extends State<TelaEstatisticas> {
  // Controllers dos campos
  final TextEditingController jogosController = TextEditingController();
  final TextEditingController golsController = TextEditingController();
  final TextEditingController assistenciasController = TextEditingController();

  // Resultados
  double mediaGols = 0;
  double mediaParticipacoes = 0;

  // ---------- FUNÇÃO DE CÁLCULO ----------

  void calcularEstatisticas() {
    int jogos = int.tryParse(jogosController.text) ?? 0;
    int gols = int.tryParse(golsController.text) ?? 0;
    int assistencias = int.tryParse(assistenciasController.text) ?? 0;

    setState(() {
      if (jogos > 0) {
        mediaGols = gols / jogos;
        mediaParticipacoes = (gols + assistencias) / jogos;
      } else {
        mediaGols = 0;
        mediaParticipacoes = 0;
      }
    });
  }

  // ---------- LIMPAR CAMPOS ----------

  void limparCampos() {
    jogosController.clear();
    golsController.clear();
    assistenciasController.clear();

    setState(() {
      mediaGols = 0;
      mediaParticipacoes = 0;
    });
  }

  @override
  void dispose() {
    jogosController.dispose();
    golsController.dispose();
    assistenciasController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísticas do Time'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ---------- JOGOS ----------
            TextField(
              controller: jogosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número de jogos disputados',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.sports_soccer),
              ),
            ),

            const SizedBox(height: 20),

            // ---------- GOLS ----------
            TextField(
              controller: golsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Total de gols marcados',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.sports_score),
              ),
            ),

            const SizedBox(height: 20),

            // ---------- ASSISTÊNCIAS ----------
            TextField(
              controller: assistenciasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Total de assistências',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.handshake),
              ),
            ),

            const SizedBox(height: 25),

            // ---------- BOTÕES ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: calcularEstatisticas,
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calcular'),
                ),

                const SizedBox(width: 15),

                OutlinedButton.icon(
                  onPressed: limparCampos,
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Limpar'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ---------- RESULTADOS ----------
            Text(
              'Média de gols por jogo: ${mediaGols.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              'Média de participações por jogo: '
              '${mediaParticipacoes.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
