import 'package:awakened_flutter/views/screens/stopwatch/stop_watch_screen.dart';
import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool loggedIn = false;
  String name = '';
  bool isVisible = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _validate() {
    final form = _formKey.currentState;
    if (form?.validate() != true) {
      return;
    }
    setState(() {
      loggedIn = true;
      final name = _nameController.text;
      final email = _emailController.text;
      isVisible = true;

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => StopWatch(name: name, email: email)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Form Mechanism',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: _buildInputForm(),
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check,
          color: Colors.orangeAccent,
        ),
        Text('Hi $name')
      ],
    );
  }

  Widget _buildInputForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isVisible)
              Text(
                _nameController.text,
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: 'Runner Name',
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder()),
              validator: (text) =>
                  text!.isEmpty ? 'Enter the runner\'s name.' : null,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter the runner\'s email';
                }
                final regex = RegExp('[^@]+@[^.]+..+');
                if (!regex.hasMatch(text)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _validate, child: const Text('Continue'))
          ],
        ),
      ),
    );
  }
}
