# flutter_icons

[![Static Badge](https://img.shields.io/badge/GitHub-v1.3.2-blue)](https://github.com/f10smobileteam/flutter-icons.git)

Customizable Icons for Flutter,Inspired by [react-native-vector-icons](https://github.com/oblador/react-native-vector-icons)

Originally Forked from https://github.com/flutter-studio/flutter-icons.git

## Notice

> > 1. `v1.0.0` has major Api changes, please be careful to upgrade
>> 2. icon names that begin with a number are preceded by a `$`prefix
>> 3. icon named with the dart keyword have the `_` suffix added

## Bundled Icon Sets

[Browse all](https://oblador.github.io/react-native-vector-icons/).

* [`AntDesign`](https://ant.design/) by AntFinance (**297** icons)
* [`Entypo`](http://entypo.com) by Daniel Bruce (**411** icons)
* [`EvilIcons`](http://evil-icons.io) by Alexander Madyankin & Roman Shamin (v1.10.1, **70** icons)
* [`Feather`](http://feathericons.com) by Cole Bemis & Contributors (v4.7.0, **266** icons)
* [`FontAwesome`](http://fortawesome.github.io/Font-Awesome/icons/) by Dave Gandy (v4.7.0, **675** icons)
* [`FontAwesome 5`](https://fontawesome.com) by Fonticons, Inc. (v5.7.0, **1500** (free))
* [`FontAwesome 7`](https://fontawesome.com/icons) by Flutter Community (v7.0.1, **2000** (free))
* [`Foundation`](http://zurb.com/playground/foundation-icon-fonts-3) by ZURB, Inc. (v3.0, **283** icons)
* [`Ionicons`](https://ionicons.com/) by Ben Sperry (v4.2.4, **696** icons)
* [`MaterialIcons`](https://www.google.com/design/icons/) by Google, Inc. (v3.0.1, **932** icons)
* [`MaterialCommunityIcons`](https://materialdesignicons.com/) by MaterialDesignIcons.com  (v4.0.96, **4416** icons)
* [`Octicons`](http://octicons.github.com) by Github, Inc. (v8.0.0, **177** icons)
* [`Zocial`](http://zocial.smcllns.com/) by Sam Collins (v1.0, **100** icons)
* [`SimpleLineIcons`](https://simplelineicons.github.io/) by Sabbir & Contributors (v2.4.1, **189** icons)
* [`Weather Icons`](https://erikflowers.github.io/weather-icons/) by erikflowers (v2.0.10, **596** icons)

## Usage

To use this plugin, add `flutter_icons` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

    flutter_icons:
        git:
            url: https://github.com/f10smobileteam/flutter-icons.git
            ref: 1.3.2

## Widgets

### FlutterIcon

* Widget for Icons that are not Traditional Shaped Icons

### IconToggle

| Prop               | Description                                                                     |
|--------------------|---------------------------------------------------------------------------------|
| selectedIconData   | Icon is displayed when value is true                                            |
| unselectedIconData | Icon is displayed when value is false                                           |
| activeColor        | When value is true, the icon color is displayed                                 |
| inactiveColor      | When value is false, the icon color is displayed                                |
| value              | Whether this IconToggle is selected.                                            |
| onChanged          | Called when the value of the IconToggle should change.                          |
| duration           | The duration of the transition from selected Icon to unselected Icon            |
| reverseDuration    | he duration of the transition from unselected Icon to selected Icon             |
| transitionBuilder  | Transition animation function between the selected Icon and the unselected Icon |

## Example

``` dart
// Import package
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

// 1.0.0 version used
Icon(AntDesign.stepforward),
Icon(Ionicons.ios_search),
Icon(FontAwesome.glass),
Icon(MaterialIcons.ac_unit),
Icon(FontAwesome5.address_book),
Icon(FontAwesome5Solid.address_book),
Icon(FontAwesome5Brands.$500px)

// After 1.1.0, the FlutterIcons class is provided to access all Icons
// Icon name in the original basis added icon set abbreviation name as suffix
// Hereinafter referred to as the following
//Ant Design Icons -> ant,
//Entypo Icons -> ent,
//Evil Icons -> evi,
//Feather Icons -> fea,
//Font Awesome Icons -> faw,
//Font Awesome 5 Regular -> faw5
//Font Awesome 5 Solid -> faw5s
//Font Awesome 5 Brands -> faw5b
//Foundation Icons -> fou,
//Ionicons Icons -> ion,
//Material Community Icons -> mco,
//Material Icons -> mdi,
//Octicons Icons -> oct,
//Simple Line Icons -> sli,
//Zocial Icons -> zoc,
//Weather Icons -> wea
Icon(FlutterIcons.stepforward_ant)
Icon(FlutterIcons.html5_faw)
...
```

####