import 'package:flutter/material.dart';
import 'package:fluttering_with_andrew/src/view_models/auth_vm.dart';
import 'package:fluttering_with_andrew/src/views/base_v.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
  }

  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }

  late TextEditingController idController;

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      builder: (context, AuthViewModel vm, child) => GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan ID user anda (1-10)',
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: false,
                    signed: false,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: vm.isStateBusy
                        ? null
                        : () async {
                            final bool isSuccess = await vm
                                .doAuth(int.tryParse(idController.text) ?? 0);
                            if (isSuccess) {
                              print(vm.user?.name);
                            }
                          },
                    child: vm.isStateBusy
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ),
                if (vm.user != null) Text(vm.user?.name ?? '-'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
