import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Enteryourfullname widget.
  FocusNode? enteryourfullnameFocusNode;
  TextEditingController? enteryourfullnameTextController;
  String? Function(BuildContext, String?)?
      enteryourfullnameTextControllerValidator;
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
  // State field(s) for ConfirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    enterpasswordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    enteryourfullnameFocusNode?.dispose();
    enteryourfullnameTextController?.dispose();

    enteryouremailFocusNode?.dispose();
    enteryouremailTextController?.dispose();

    enterpasswordFocusNode?.dispose();
    enterpasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
