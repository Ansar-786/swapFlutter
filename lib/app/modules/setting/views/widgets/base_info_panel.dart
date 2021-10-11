part of setting_view;

class BaseInfoPanel extends StatelessWidget {
  const BaseInfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StoreController store = Get.find();
    return Container(
      height: 411.h,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoActionSheet(
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          _openGallery();
                        },
                        child: Text(
                          "从手机相册选择",
                          style: TextStyle(
                            fontSize: Adapt.font(34),
                          ),
                        ),
                        isDefaultAction: true,
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _takePhoto();
                        },
                        child: Text(
                          "拍照",
                          style: TextStyle(
                            fontSize: Adapt.font(34),
                          ),
                        ),
                        isDefaultAction: true,
                      )
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "取消",
                        style: TextStyle(
                          fontSize: 34.f,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Obx(() {
              return Image(
                width: 112.w,
                height: 112.w,
                image: AssetImage(store.loginData.value.userPhoto ??
                    "images/my_avatar_default.png"),
              );
            }),
          ),
          SizedBox(
            height: 40.h,
          ),
          Obx(
            () => Text(
              store.loginData.value.account ?? '--',
              style: TextStyle(
                fontSize: 36.f,
                color: Colours.app_main,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 从相册选择照片
  _openGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print(image);
  }

  /// 拍照
  _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    print(image);
  }
}
