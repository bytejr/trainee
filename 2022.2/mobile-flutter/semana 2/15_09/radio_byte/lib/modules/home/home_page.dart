import 'package:flutter/material.dart';
import 'package:radio_byte/shared/themes/app_colors.dart';
import 'package:radio_byte/shared/themes/app_images.dart';
import 'package:radio_byte/shared/themes/app_text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nameImage = AppImages.noSignal;
  String nameChanel = "Sem Sinal";
  double sliderValue = 90.2;

  @override
  Widget build(BuildContext context) {
    void changeImage() {
      switch (sliderValue.toStringAsFixed(1)) {
        case '96.9':
          nameImage = AppImages.band;
          nameChanel = 'Band News FM';
          break;
        case '90.5':
          nameImage = AppImages.cbn;
          nameChanel = 'Rádio CBN';
          break;
        case '100.9':
          nameImage = AppImages.jovemPan;
          nameChanel = 'Rádio Jovem Pan';
          break;
        default:
          nameImage = AppImages.noSignal;
          nameChanel = "Sem Sinal";
          break;
      }
    }

    void moveSlider(double value) {
      setState(() {
        sliderValue += value;
        changeImage();
      });
    }

    final size = MediaQuery.of(context).size;
    return Column(children: [
      // Imagem
      Container(
        margin: EdgeInsets.all(22),
        width: size.width * 0.72,
        height: size.width * 0.72,
        child: Image.asset(nameImage),
      ),

      // Texto de descrição estação
      Text('${sliderValue.toStringAsFixed(1)}, $nameChanel',
          style: AppTextStyle.sliderValue),

      // Slider
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbColor: AppColors.bege,
          activeTrackColor: AppColors.black,
          inactiveTrackColor: AppColors.black,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
        ),
        child: Slider(
          value: sliderValue,
          min: 90,
          max: 101,
          onChanged: (double value) {
            setState(() {
              sliderValue = value;
              changeImage();
            });
          },
        ),
      ),

      // Botão Esq. Dir. FM
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              moveSlider(-0.1);
            },
            child: const Icon(
              Icons.keyboard_double_arrow_left,
              color: AppColors.black,
            ),
          ),
          Text("FM", style: AppTextStyle.fm),
          TextButton(
            onPressed: () {
              moveSlider(0.1);
            },
            child: Icon(
              Icons.keyboard_double_arrow_right,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    ]);
  }
}
