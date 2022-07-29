
import 'package:flutter/material.dart';
import 'package:kib_task/utils/app_colors.dart';
import 'package:kib_task/utils/common.dart';
import 'package:kib_task/utils/dimensions.dart';
import 'package:kib_task/utils/text_styles.dart';

class AddNoteDialog extends StatefulWidget {
  final void Function(String content)? onSubmitPressed;
  final String? initialContent;
  const AddNoteDialog({Key? key, this.onSubmitPressed, this.initialContent}) : super(key: key);

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  final _noteController = TextEditingController();

  @override
  void initState() {
    _noteController.text = widget.initialContent ?? "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(PaddingDimensions.large),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            Material(
              child: TextFormField(
                controller: _noteController,
              ),
            ),

            SizedBox(height: PaddingDimensions.large,),

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyles.semiBold(
                        color: AppColors.textTertiaryColor,
                        fontSize: Dimensions.normal
                      ),
                    ),
                  ),
                ),

                SizedBox(width: PaddingDimensions.normal,),

                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (_noteController.text.isEmpty) {
                        showErrorSnackBar(context, "You must write anything");
                        return;
                      }
                      print("asdasd");
                      if (widget.onSubmitPressed != null) {
                        widget.onSubmitPressed!(_noteController.text);
                      }
                      print("dfghhhhhhh");
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyles.semiBold(
                          color: AppColors.textTertiaryColor,
                          fontSize: Dimensions.normal
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
