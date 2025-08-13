import 'package:auto_route/auto_route.dart';
import 'package:boneconsulting/core/index.dart';
import 'package:boneconsulting/presentation/auth/login/notifier/login_notifier.dart';
import 'package:boneconsulting/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late ValueNotifier<bool> passwordVisiblityNotifier;
  late AutovalidateMode autovalidateMode;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisiblityNotifier = ValueNotifier<bool>(false);
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordVisiblityNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final state = ref.watch(loginProvider);
    final event = ref.read(loginProvider.notifier);
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(height: 260, color: AppColor.primary),
                Positioned(
                  bottom: 32,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.login.title,
                        style: styleHeader1Bold.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    CustomLabel(
                      text: t.textfield.email.label,
                      isRequired: true,
                    ),
                    CustomTextfield(
                      controller: emailController,
                      hint: t.textfield.email.label,
                      inputType: TextInputType.emailAddress,
                      validator: (val) {
                        if (!val!.isValidEmail) return t.textfield.email.error;
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomLabel(
                      text: t.textfield.password.label,
                      isRequired: true,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: passwordVisiblityNotifier,
                      builder: (context, passwordVisiblity, child) {
                        return CustomTextfield(
                          controller: passwordController,
                          hint: t.textfield.password.hint,
                          obscureText: !passwordVisiblityNotifier.value,
                          validator: (val) {
                            if (!val!.isNotEmpty) {
                              return t.textfield.password.error;
                            }
                            return null;
                          },
                          suffix: InkWell(
                            onTap: () {
                              passwordVisiblityNotifier.value =
                                  !passwordVisiblityNotifier.value;
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                passwordVisiblityNotifier.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColor.neutral40,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      // isLoading: provider.state.status == LoginStatus.loading,
                      label: t.button.login,
                      onPressed: () async {
                        event.login(
                          context,
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                        if (_formKey.currentState!.validate()) {
                          AutoRouter.of(context).pushAndPopUntil(
                            const MainRoute(),
                            predicate: (_) => false,
                          );
                        }
                      },
                    ),
                    // const SizedBox(height: 16),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(t.login.no_account, style: styleParagraph1),
                    //     InkWell(
                    //       onTap: () {
                    //         AutoRouter.of(context).push(const RegisterRoute());
                    //       },
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(
                    //           t.button.register,
                    //           style: styleParagraph1Bold.copyWith(
                    //             color: AppColor.primary,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
