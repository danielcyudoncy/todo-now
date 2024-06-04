import '/flutter_flow/flutter_flow_util.dart';
import 'forget_password_widget.dart' show ForgetPasswordWidget;
import 'package:flutter/material.dart';

class ForgetPasswordModel extends FlutterFlowModel<ForgetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Enteryouremail widget.
  FocusNode? enteryouremailFocusNode;
  TextEditingController? enteryouremailTextController;
  String? Function(BuildContext, String?)?
      enteryouremailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    enteryouremailFocusNode?.dispose();
    enteryouremailTextController?.dispose();
  }
}
