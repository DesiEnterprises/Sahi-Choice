import '/flutter_flow/flutter_flow_util.dart';
import 'verify_phone_widget.dart' show VerifyPhoneWidget;
import 'package:flutter/material.dart';

class VerifyPhoneModel extends FlutterFlowModel<VerifyPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
