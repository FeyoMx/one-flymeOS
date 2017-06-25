#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9963520 664eba9b191fa582c5f35007f681864af3645537 7294976 6063e64d704b4f0b4ab3e9335d2093b71bcc8f9d
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11120000.msdc0/by-name/recovery:9963520:664eba9b191fa582c5f35007f681864af3645537; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11120000.msdc0/by-name/boot:7294976:6063e64d704b4f0b4ab3e9335d2093b71bcc8f9d EMMC:/dev/block/platform/mtk-msdc.0/11120000.msdc0/by-name/recovery 664eba9b191fa582c5f35007f681864af3645537 9963520 6063e64d704b4f0b4ab3e9335d2093b71bcc8f9d:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
