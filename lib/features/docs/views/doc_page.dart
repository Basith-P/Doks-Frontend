import 'package:doks/config/theme/colors.dart';
import 'package:doks/features/auth/providers.dart';
import 'package:doks/features/docs/models/document.dart';
import 'package:doks/features/docs/providers.dart';
import 'package:doks/utils/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocPage extends ConsumerStatefulWidget {
  const DocPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DocPageState();
}

class _DocPageState extends ConsumerState<DocPage> {
  late TextEditingController _titleController;
  late QuillController _quillController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: 'Untitled');
    _quillController = QuillController.basic();
  }

  void updateTitle() {
    ref.read(docsRepositoryProvider).updateDoc(
          token: ref.read(userProvider)!.token!,
          doc: Doc(
            id: widget.id,
            title: _titleController.text,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(getDocProvider(widget.id)).when(
          data: (data) {
            _titleController.text = data.title ?? 'Untitled';

            return Scaffold(
              appBar: AppBar(
                title: TextField(
                  controller: _titleController,
                  onEditingComplete: updateTitle,
                  onTapOutside: (_) => updateTitle(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintText: 'Untitled',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blue)),
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  ),
                ),
                actions: [
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.lock_rounded, size: 16),
                    label: const Text('Share'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1),
                  child: Container(
                    color: AppColors.lightGray,
                    height: 1,
                  ),
                ),
              ),
              body: QuillProvider(
                configurations: QuillConfigurations(
                  controller: _quillController,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const QuillToolbar(),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.lightGray,
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                            height: double.infinity,
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: QuillEditor.basic(
                                configurations: const QuillEditorConfigurations(
                                  readOnly: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          error: (e, st) => Center(child: Text(e.toString())),
          loading: () => loaderPrimary,
        );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _quillController.dispose();
    super.dispose();
  }
}
