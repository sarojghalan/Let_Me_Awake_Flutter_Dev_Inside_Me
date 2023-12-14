
import 'package:awakened_flutter/views/screens/login/feature/login_form_field.dart';
import 'package:flutter/material.dart';

class SectionLoginForm extends StatelessWidget {
  const SectionLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      width: 350,
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: const Column(
        children: [
          SectionFormField(
              label: 'Login ID', helperText: "Please Insert your login ID."),
          SectionFormField(
              label: 'Password', helperText: "Please Insert Your Password."),
          SectionLoginButton(),
          SectionOr(),
          SectionLoginOptions()
        ],
      ),
    );
  }
}

class SectionLoginButton extends StatelessWidget {
  const SectionLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: SizedBox(
        width: 320,
        height: 50,
        child: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}

class SectionOr extends StatelessWidget {
  const SectionOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 1,
          width: 30,
          child: Divider(
            color: Colors.purple,
            thickness: 2,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 12, right: 12),
          child: const Text(
            'OR',
            style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 1,
          width: 30,
          child: Divider(
            color: Colors.purple,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}

class SectionLoginOptions extends StatelessWidget {
  const SectionLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: 50,
            width: 50,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(100), color: Colors.purple),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(100)),
              child: const Center(
                  child: Icon(
                Icons.login,
                color: Colors.white,
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: 50,
            width: 50,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(100), color: Colors.purple),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(100)),
              child: const Center(
                  child: Icon(
                Icons.close,
                color: Colors.white,
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: 50,
            width: 50,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(100), color: Colors.purple),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(100)),
              child: const Center(
                  child: Icon(
                Icons.local_activity,
                color: Colors.white,
              )),
            ),
          ),
        ),
      ],
    );
  }
}
