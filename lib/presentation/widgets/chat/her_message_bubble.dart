import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //busca el tema dentro del contexto
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text( message.text, style: const TextStyle(color: Colors.white),),
          ),
        ),

        const SizedBox(height: 7),

         (message.imageUrl != null 
          ? _ImageBubble(imageUrl: message.imageUrl!) 
          : const SizedBox.shrink()),


        const SizedBox(height: 10),

        //Todo: imagen

        

      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
 final String imageUrl;

   const _ImageBubble({  required this.imageUrl });

  @override
  Widget build(BuildContext context) {
    



    //El context hace referencia al arbol de widget y al context le pedimos su tamaño(size)
    final size = MediaQuery.of(context).size;
  

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if( loadingProgress == null ) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const Text('Mi girasol esta escribiendo... '),
          );
        },
        )
      );
  }
}