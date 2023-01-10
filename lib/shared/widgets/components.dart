import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//-------------------------------------------- CUSTOM BTN --------------------------------------------------

Widget customBtn({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required VoidCallback onPressed,
  required String text,
}) =>
    Container(
      width: width,
      height: 60.0,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------ CUSTOM TXT-BTN ----------------------------------------

Widget customTextButton({
  required VoidCallback onPressed,
  required String text,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
      ),
    );
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------ CUSTOM TXT-FORM-FIELD ----------------------------------------

Widget customTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  bool isPassword = false,
  Function(String)? onSubmit,
  Function(String)? onChange,
  VoidCallback? onTap,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: ((value) {
        if (value!.isEmpty) {
          return 'This Field is Requierd!';
        }
      }),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
      ),
    );
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------ CUSTOM NAVIGATOR ----------------------------------------

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
                         //------------------------------------------//
void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------ CUSTOM FLUTTER-TOAST ----------------------------------------

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------ CUSTOM CIRCLE-AVATAR-CHAT ----------------------------------------

Widget customCircleAvatarChats() => Stack(
  alignment: Alignment.bottomRight,
  children: [
    CircleAvatar(
      radius: 30.0,
      backgroundImage: NetworkImage(
          'https://www.bing.com/images/search?view=detailV2&ccid=n60XrHSu&id=CADC0509974438238ACC83803980AD6B86B132CC&thid=OIP.n60XrHSu6LiID9tmdmdMAgHaFj&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.9fad17ac74aee8b8880fdb6676674c02%3frik%3dzDKxhmutgDmAgw%26riu%3dhttp%253a%252f%252fwww.business-opportunities.biz%252fwp-content%252fuploads%252f2013%252f11%252fsteve_jobs.jpg%26ehk%3dsJ%252bHnk05IEvTslnzxDiyD0KK2tvLQBcxfTDVFUi21i8%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=768&expw=1024&q=steve+jobs&simid=608034547745244468&FORM=IRPRST&ck=3FC3566A0D5F68E5BF60BCFE7388574C&selectedIndex=13&ajaxhist=0&ajaxserp=0'),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 3.0, right: 3.0),
      child: CircleAvatar(
        radius: 9.0,
        backgroundColor: Colors.red,
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(
        bottom: 3.0,
        right: 3.0,
      ),
      child: CircleAvatar(
        radius: 8.0,
        backgroundColor: Colors.green,
      ),
    ),
  ],
);