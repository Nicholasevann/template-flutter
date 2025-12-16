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
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/login-background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Title and subtitle at the top
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Column(
                        children: [
                          Image.asset(
                            'assets/icon/logo-splash.png',
                            width: 180,
                          ),
                          const SizedBox(height: 60),
                          Text(
                            'Welcome to B One',
                            style: styleHeader1.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Sign in to manage your projects, teams, attendance,and more — all in one powerful platform.',
                            style: styleParagraph1.copyWith(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom sheet login form
              Align(
                alignment: Alignment.bottomCenter,
                child: DraggableScrollableSheet(
                  initialChildSize: 0.65,
                  minChildSize: 0.65,
                  maxChildSize: 1,
                  builder: (context, scrollController) {
                    return SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, -10),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Form(
                            key: _formKey,
                            autovalidateMode: autovalidateMode,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomLabel(
                                  text: t.textfield.email.label,
                                  isRequired: true,
                                ),
                                CustomTextfield(
                                  controller: emailController,
                                  hint: t.textfield.email.label,
                                  inputType: TextInputType.emailAddress,
                                  validator: (val) {
                                    if (!val!.isNotEmpty) {
                                      return t.textfield.email.error;
                                    }
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
                                      obscureText:
                                          !passwordVisiblityNotifier.value,
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
                                const SizedBox(height: 10),
                                // Forgot Password
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      // Handle forgot password
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // Sign In Button
                                Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        setState(() {
                                          autovalidateMode =
                                              AutovalidateMode.always;
                                        });
                                        if (_formKey.currentState!.validate()) {
                                          event.login(
                                            context,
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                          );
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(16),
                                      child: const Center(
                                        child: Text(
                                          'Sign in',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
