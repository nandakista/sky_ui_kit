<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Overview

This package contains a set of reusable widget.
Provides common widgets that can help to your screen.

# Getting Started

Add dependency to your **pubspec.yaml**
```dart
dependencies:
  sky_ui_kit : "^version"
```
# Usage

## Common Widget

### SkyBox
![SkyBox](https://user-images.githubusercontent.com/47182823/232361924-4d5e658c-de7f-4f03-8c9f-d3c5c069a7db.png)

```dart
SkyBox(
  borderColor: Colors.grey,
  color: Colors.white,
  height: 80,
  width: 120,
  margin: EdgeInsets.zero,
  padding: const EdgeInsets.all(8),
  borderRadius: BorderRadius.circular(12),
  elevation: 9,
  child: const SomeWidget(),
  onPressed: () {},
);
```

### SkyButton

#### Example Button 1

![SkyButton-1](https://user-images.githubusercontent.com/47182823/232362013-9be4f965-69e2-4dcd-a1db-cd116d2b7c38.png)

```dart
SkyButton(
  text: 'Button',
  fontSize: 16,
  elevation: 4,
  borderRadius: 12,
  icon: Icons.ac_unit,
  iconColor: Colors.white,
  wrapContent: true,
  borderColor: Colors.yellow,
  borderWidth: 3,
  onPressed: () {},
),
```

#### Example Button 2

![SkyButton-2](https://user-images.githubusercontent.com/47182823/232362053-d20c3032-c685-41e3-9b4e-1f6ba91b2988.png)

```dart
SkyButton(
  text: 'Button',
  iconWidget: const SkyImage(url: 'assets/fork.svg', width: 20),
  onPressed: () {}
),
```

#### Example Button 3

![SkyButton-3](https://user-images.githubusercontent.com/47182823/232362063-961e97cb-361e-4982-b5fd-b85e24eeb8a6.png)

```dart
SkyButton(
  text: 'Button',
  outlineMode: true,
  onPressed: () {},
),
```

### SkyIconButton

![SkyIconButton](https://user-images.githubusercontent.com/47182823/232362587-1a1b7d60-1b02-4b11-8d9c-ffd19dd50061.png)

```dart
SkyIconButton(
  icon: Icons.ac_unit,
  size: 80,
  iconColor: Colors.black,
  color: Colors.orange,
  onTap: () {},
);
```

### InfoTable

<img width="357" alt="Screenshot 2023-04-17 at 21 18 25" src="https://user-images.githubusercontent.com/47182823/232514237-a963bb5c-aec7-44e4-9b3d-a66632d604b7.png">

```dart
InfoTable(
  cellTextAlign: TextAlign.end,
  separatorEnabled: false,
  data: {
    'Title': 'InfoTable Widget',
    'Description': 'Some description...',
    'Description 2': 'Some description2...',
  },
)
```

### KeyboardDismisser

To use keyboard dismisser you need wrap your parent widget with KeyboardDismisser.

```dart
KeyboardDismisser(
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Sky UI Kit Demo'),
      ),
      body: ...
    ),
  ),
);
```

### ColoredStatusBar

To use ColoredStatusBar you need wrap your parent widget it. Even if you use keyboard dismisser, the status bar is still the top of your widget.

<p float="left">
  <img width="357" alt="Screenshot 2023-04-17 at 21 23 06" src="https://user-images.githubusercontent.com/47182823/232515247-2ad43e6a-9033-491e-90a9-bef7f39903d3.png">
  <img width="380" alt="Screenshot 2023-04-19 at 22 44 06" src="https://user-images.githubusercontent.com/47182823/233270436-a157380e-d996-4fb6-a0d3-ef3dbc2637e9.png">
</p>

```dart
ColoredStatusBar(
  color: Colors.red,
  brightness: Brightness.light,
    child: KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sky UI Kit Demo'),
        ),
        body: ...
      ),
    ),
  ),
);
```

### CircleIcon

<img width="150" alt="Screenshot 2023-04-17 at 21 34 30" src="https://user-images.githubusercontent.com/47182823/232518706-4a85bba4-a329-4274-93e1-4f3357f6ae4d.png">

```dart
CircleIcon(
  icon: Icon(Icons.lock),
  backgroundColor: Colors.cyanAccent,
  splashColor: Colors.yellow,
  size: 54,
  onTap: () {},
)
```

### Platform Loading Indicator

Two style of Loading Indicator in one widget.

<img width="192" alt="Screenshot 2023-04-17 at 21 42 23" src="https://user-images.githubusercontent.com/47182823/232520907-be70c405-1a67-447a-b414-41fdda9a835a.png">

```dart
PlatformLoadingIndicator();
```

<br>


## Media

### SkyImage

Use your image source from jpg, png, svg, url, and local path in One Widget.<br />
Handling preview image, empty image, and radius of the image.


<img width="279" alt="Screenshot 2023-04-17 at 22 14 56" src="https://user-images.githubusercontent.com/47182823/232531301-2d47ba4e-b477-4f51-8449-eb3d8c52616d.png">

<img width="157" alt="Screenshot 2023-04-17 at 22 15 23" src="https://user-images.githubusercontent.com/47182823/232531355-d2a2cb09-d301-4460-8b2c-72ae21de0bfe.png">

```dart
SkyImage(
  src: 'https://picsum.photos/200/300.jpg',
  width: 260,
  height: 180,
  borderRadius: BorderRadius.circular(30),
  enablePreview: true,
  emptyOrNullSrc: 'assets/img_empty.png',
  emptyOrNullFit: BoxFit.cover,
)
```

### SkyVideo

Provides widget that handle video from url or local path

```dart
SkyVideo(
  url:
  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  height: 200,
);
```

### MediaItems

#### List

<img width="553" alt="Screenshot 2023-04-19 at 14 54 09" src="https://user-images.githubusercontent.com/47182823/233007160-0c08026b-77be-4f0c-9529-5d79df5f3c4d.png">

```dart
MediaItems(
  mediaUrls: [
    'https://picsum.photos/200/300.jpg',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://fujifilm-x.com/wp-content/uploads/2021/01/gfx100s_sample_04_thum-1.jpg',
    'https://images.squarespace-cdn.com/content/v1/56169907e4b07744e81fe688/1568573110797-OQQY3Z4EG644FOCS7XQG/Swiss+Alps+-+Mont+Blanc+Massif-1.jpg',
    'https://picsum.photos/200/300.jpg',
    'assets/img_sample.png',
  ],
  itemsSpacing: 12,
  maxItem: 5,
)
```

#### Grid
Media item as a grid view <br>

<img width="229" alt="Screenshot 2023-04-19 at 12 23 46" src="https://user-images.githubusercontent.com/47182823/232989791-e94bbac3-83f3-4183-86c1-9f147c8e54c0.png">

```dart
MediaItems(
  mediaUrls: [
    'https://picsum.photos/200/300.jpg',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://fujifilm-x.com/wp-content/uploads/2021/01/gfx100s_sample_04_thum-1.jpg',
    'https://images.squarespace-cdn.com/content/v1/56169907e4b07744e81fe688/1568573110797-OQQY3Z4EG644FOCS7XQG/Swiss+Alps+-+Mont+Blanc+Massif-1.jpg',
    'assets/img_sample.png',
  ],
  maxItem: 4,
  isGrid: true,
  size: 120,
  isSwipePreview: true,
)
```

<br>


## Collection View

In this section (collection view) we use example data especially for **GroupedListView**.<br>
We give you an example data below.

The sample model data given is :
```dart
class CityModel {
  String province;
  String city;

  CityModel(this.province, this.city);
}
```

And the dummy data list is :
```dart
List<CityModel> dataCity = [
  CityModel('Jakarta', 'SCBD'),
  CityModel('Jakarta', 'Tebet'),
  CityModel('Jakarta', 'Gambir'),
  CityModel('Lampung', 'Bandar Lampung'),
  CityModel('Lampung', 'Pringsewu'),
  CityModel('Bandung', 'Setrasari'),
  CityModel('Bandung', 'Gedebage'),
  CityModel('Bandung', 'Cihanjuang'),
  CityModel('Yogyakarta', 'Bantul'),
  CityModel('Yogyakarta', 'Sleman'),
];
```

### GroupedListView

<img width="359" alt="Screenshot 2023-04-19 at 20 07 10" src="https://user-images.githubusercontent.com/47182823/233084490-72a5e08d-d2ee-4763-8d1e-150cfe5c491d.png">

Example code:

```dart
SkyGroupedListView<CityModel, String>(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  sortBy: SortBy.ASC,
  data: dataCity,
  separator: const Divider(thickness: 1, height: 12),
  separatorGroup: const Divider(
    thickness: 1,
    height: 12,
    color: Colors.red,
  ),
  groupHeaderBuilder: (group) {
    return Text(
      group.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  },
  itemBuilder: (context, index, item) {
    return Text(
      item.city,
      textAlign: TextAlign.start,
    );
  },
  groupBy: (element) => element.province,
)
```

### OrderedList

<img width="357" alt="Screenshot 2023-04-19 at 19 22 59" src="https://user-images.githubusercontent.com/47182823/233073776-ba1ec50a-6924-4dcc-876a-8ee369d52444.png">

```dart
OrderedList(
  itemCount: 4,
  shrinkWrap: true,
  separator: const Divider(height: 12),
  itemBuilder: (context, index) {
    return Text('Item with index = $index');
  },
)
```

<br>

# Additional information

Thank you.
Hope this package can help you.
Happy coding..