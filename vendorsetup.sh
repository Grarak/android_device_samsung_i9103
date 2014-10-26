add_lunch_combo cm_i9103-userdebug

echo "Apply patch to frameworks/base"
echo -n "Apply patch 0001-framework-base-patch.patch"
(cd frameworks/base; git am ../../device/samsung/i9103/patches/0001-framework-base-patch.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/base; git am --abort)
	echo "     [FAIL]"
fi

echo -n "Apply patch 0002-DisplayDevice-Backwards-compatibility-with-old-EGL.patch"
(cd frameworks/native; git am ../../device/samsung/i9103/patches/0002-DisplayDevice-Backwards-compatibility-with-old-EGL.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/native; git am --abort)
	echo "     [FAIL]"
fi
echo -n "Apply patch 0002-Add-missing-functions-and-signatures-for-older-OMX-v.patch"
(cd frameworks/av; git am ../../device/samsung/i9103/patches/0002-Add-missing-functions-and-signatures-for-older-OMX-v.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/av; git am --abort)
	echo "     [FAIL]"
fi


echo -n "Apply patch 0001-external-skia-patch.patch"
(cd external/skia; git am ../../device/samsung/i9103/patches/0001-external-skia-patch.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/av; git am --abort)
	echo "     [FAIL]"
fi

echo "Apply patch to external/chromium_org"
echo -n "Apply patch 0001-Work-around-broken-GL_TEXTURE_BINDING_EXTERNAL_OES-q.patch"
(cd external/chromium_org; git am ../../device/samsung/i9103/patches/0001-Work-around-broken-GL_TEXTURE_BINDING_EXTERNAL_OES-q.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
  echo "     [DONE]"
else
  (cd external/chromium_org; git am --abort)
  echo "     [FAIL]"
fi

echo "Apply patch to frameworks/native"
echo -n "Apply patch 0001-Fix-layer-dump-for-tegra2.patch"
(cd frameworks/native; git am ../../device/samsung/i9103/patches/0001-Fix-layer-dump-for-tegra2.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd frameworks/native; git am --abort)
       echo "     [FAIL]"
fi

echo "Apply patch to bionic"
echo -n "Apply patch 0003-Add-tegra2-to-bionic.patch"
(cd bionic; git am ../device/samsung/i9103/patches/0003-Add-tegra2-to-bionic.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
    echo "     [DONE]"
else
    (cd bionic; git am --abort)
    echo "     [FAIL]"
fi
