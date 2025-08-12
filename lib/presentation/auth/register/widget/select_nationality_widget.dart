import 'package:example/core/index.dart';
import 'package:example/data/models/country/country_model.dart';
import 'package:example/presentation/auth/register/notifier/register_notifier.dart';
import 'package:example/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectNationalityWidget extends ConsumerStatefulWidget {
  final double heightFactor;
  final Function(CountryModel) onTap;

  const SelectNationalityWidget({
    super.key,
    required this.heightFactor,
    required this.onTap,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectNationalityWidgetState();
}

class _SelectNationalityWidgetState
    extends ConsumerState<SelectNationalityWidget> {
  @override
  Widget build(BuildContext context) {
    final countries = ref.watch(registerProvider).countries;
    final selected = ref.watch(registerProvider).selectedCountry;
    return Column(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text('Select Nationality', style: styleParagraph1Bold),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.close, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        SizedBox(
          height: (context.screenSize.height * widget.heightFactor) - 51,
          child: ListView.separated(
            itemCount: countries.length,
            separatorBuilder: (context, index) {
              return const Divider(height: 1, indent: 16);
            },
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  widget.onTap(countries[index]);
                },
                title: Text(countries[index].name?.common ?? ''),
                leading: CustomCachedImage(
                  url: countries[index].flags?.png,
                  width: 40,
                ),
                trailing: countries[index] == selected
                    ? const Icon(Icons.check)
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
