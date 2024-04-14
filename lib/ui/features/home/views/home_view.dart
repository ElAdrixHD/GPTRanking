import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ranking_app/ui/features/home/components/gpt_response_tile.dart';
import 'package:ranking_app/ui/features/home/providers/gpt_provider.dart';
import 'package:ranking_app/ui/features/home/providers/input_provider.dart';
import 'package:ranking_app/ui/features/home/view_model/basic_input_field_view_model.dart';
import 'package:ranking_app/ui/i18n/locale_keys.g.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(gptProvider, (previous, next) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          if (!next.loading) {
            _scrollToEnd();
          }
        },
      );
    });
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.home_view_title.tr(),
          ),
        ),
        body: SafeArea(
          child: _buildBody(),
        ),
      ),
    );
  }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildGPTScreen()),
          const SizedBox(
            height: 20,
          ),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _buildInput() {
    final form = ref.watch(inputProvider);
    return ReactiveBasicInputFieldModelForm(
      form: form,
      child: ReactiveFormBuilder(
        form: () => form.form,
        builder: (context, _, __) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ReactiveTextField(
                    formControl: form.inputControl,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ReactiveBasicInputFieldModelFormConsumer(
                  builder: (context, model, child) {
                    return SizedBox(
                      height: 50,
                      child: FloatingActionButton(
                        onPressed: model.form.valid
                            ? () async {
                                final input =
                                    ref.read(inputProvider).model.input;
                                ref.read(inputProvider.notifier).clear();
                                FocusManager.instance.primaryFocus?.unfocus();
                                ref
                                    .read(gptProvider.notifier)
                                    .getResponse(input);
                              }
                            : null,
                        child: const Icon(
                          Icons.send,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGPTScreen() {
    return Builder(
      builder: (context) {
        final gptResponse = ref.watch(gptProvider);
        if (gptResponse.error != null) {
          return Center(
            child: Text(gptResponse.error ?? ''),
          );
        }
        if (gptResponse.response.isEmpty) {
          return Center(
            child: Text(
              LocaleKeys.home_view_empty_list.tr(),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.read(gptProvider.notifier).restart(),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: gptResponse.response.length,
            itemBuilder: (context, i) {
              final item = gptResponse.response[i];
              return GPTResponseTile(response: item);
            },
          ),
        );
      },
    );
  }
}
