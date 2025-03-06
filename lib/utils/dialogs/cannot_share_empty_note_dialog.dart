import 'package:dart/utils/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Share',
    content: 'Cannot share empty note.',
    optionsBuilder: () => {
      'Ok': null,
    },
  );
}
