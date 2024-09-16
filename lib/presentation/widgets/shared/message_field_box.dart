import 'package:flutter/material.dart';


class MessageFielBox extends StatelessWidget {

  final ValueChanged<String> onValue;
  const MessageFielBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    //este elemento nos dara control del input a lo cual lo asociaremos
    final textController = TextEditingController();

    //Para mantener el foco
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
        
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
        )
      );
    

    return TextFormField(
      //cuando haga click fuera del teclado la misma se cierra
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      //submit
      onFieldSubmitted: (value) {
        textController.clear();
        //luego de limpiar mantenemos el foco
        focusNode.requestFocus();
        //emitimos el value
        onValue(value);
      },
      
      //onChanged captura los cambios realizados en el teclado
      onChanged: (value) {
      //  print('change: $value');
      },
    );
  }
}