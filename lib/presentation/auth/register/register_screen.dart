import 'package:auto_route/auto_route.dart';
import 'package:boneconsulting/core/index.dart';
import 'package:boneconsulting/presentation/auth/register/notifier/register_notifier.dart';
import 'package:boneconsulting/presentation/auth/register/widget/select_nationality_widget.dart';
import 'package:boneconsulting/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController nationalityController;
  late ValueNotifier<bool> passwordVisiblityNotifier;
  late ValueNotifier<bool> confirmPasswordVisiblityNotifier;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nationalityController = TextEditingController();
    passwordVisiblityNotifier = ValueNotifier<bool>(false);
    confirmPasswordVisiblityNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nationalityController.dispose();
    passwordVisiblityNotifier.dispose();
    confirmPasswordVisiblityNotifier.dispose();
    super.dispose();
  }

  showNationalityBottomSheet(BuildContext context) async {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) {
        return FractionallySizedBox(
          heightFactor: 0.76,
          child: SelectNationalityWidget(
            heightFactor: 0.76,
            onTap: (country) {
              ref.read(registerProvider.notifier).selectNationality(country);
              nationalityController.text = country.name?.common ?? '';
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final selectedCountry = ref.watch(registerProvider).selectedCountry;
    return Scaffold(
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
                        t.register.title,
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
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    CustomLabel(
                      text: t.textfield.fullname.label,
                      isRequired: true,
                    ),
                    CustomTextfield(
                      controller: emailController,
                      hint: t.textfield.fullname.hint,
                      inputType: TextInputType.emailAddress,
                      validator: (val) {
                        if (!val!.isValidEmail) {
                          return t.textfield.fullname.error;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomLabel(
                      text: t.textfield.email.label,
                      isRequired: true,
                    ),
                    CustomTextfield(
                      controller: emailController,
                      hint: t.textfield.email.hint,
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
                    const SizedBox(height: 8),
                    CustomLabel(
                      text: t.textfield.password_confirm.label,
                      isRequired: true,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: confirmPasswordVisiblityNotifier,
                      builder: (context, confirmPasswordVisiblity, child) {
                        return CustomTextfield(
                          controller: confirmPasswordController,
                          hint: t.textfield.password_confirm.hint,
                          obscureText: !confirmPasswordVisiblityNotifier.value,
                          validator: (val) {
                            if (!val!.isNotEmpty) {
                              return t.textfield.password_confirm.error;
                            }
                            return null;
                          },
                          suffix: InkWell(
                            onTap: () {
                              confirmPasswordVisiblityNotifier.value =
                                  !confirmPasswordVisiblityNotifier.value;
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                confirmPasswordVisiblityNotifier.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColor.neutral40,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    const CustomLabel(
                      text: 'Nationality',
                      isRequired: true,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: confirmPasswordVisiblityNotifier,
                      builder: (context, confirmPasswordVisiblity, child) {
                        return CustomTextfield(
                          onTap: () {
                            showNationalityBottomSheet(context);
                          },
                          controller: nationalityController,
                          hint: 'Select Nationality',
                          prefix: selectedCountry == null
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: CustomCachedImage(
                                    url: selectedCountry.flags?.png,
                                    width: 40,
                                  ),
                                ),
                          suffix: Container(
                            padding: const EdgeInsets.all(12.0),
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: AppColor.neutral40,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      // isLoading: provider.state.status == LoginStatus.loading,
                      label: t.button.register,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          AutoRouter.of(context).back();
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(t.register.have_account, style: styleParagraph1),
                        InkWell(
                          onTap: () {
                            AutoRouter.of(context).back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              t.button.login,
                              style: styleParagraph1Bold.copyWith(
                                color: AppColor.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
