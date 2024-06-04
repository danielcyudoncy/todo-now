import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Enteryouremail widget.
  FocusNode? enteryouremailFocusNode;
  TextEditingController? enteryouremailTextController;
  String? Function(BuildContext, String?)?
      enteryouremailTextControllerValidator;
  // State field(s) for Enterpassword widget.
  FocusNode? enterpasswordFocusNode;
  TextEditingController? enterpasswordTextController;
  late bool enterpasswordVisibility;
  String? Function(BuildContext, String?)? enterpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    enterpasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    enteryouremailFocusNode?.dispose();
    enteryouremailTextController?.dispose();

    enterpasswordFocusNode?.dispose();
    enterpasswordTextController?.dispose();
  }
}
