From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/16] unify usb mcu layer between mt76x2u and mt76x0u drivers
Date: Sat, 25 Aug 2018 12:40:40 +0200
Message-ID: <20180825104056.9130-1-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Use shared mt76u mcu routines available in mt76-usb module and
unify usb mcu layer between mt76x2u and mt76x0u drivers.
Remove unused mt76x0 routines.
This patchset is based on top of Stanislaw's patchset (not applied yet):
https://marc.info/?l=linux-wireless&m=153510933510810&w=2

Lorenzo Bianconi (16):
  mt76: move mt76_reg_pair definition in mt76.h
  mt76: split __mt76u_mcu_send_msg and mt76u_mcu_send_msg routines
  mt76: move mt76x2u_mcu_deinit routine in mt76-usb module
  mt76: add multiple regs read support to usb_mcu layer
  mt76x0: use mt76u_init for bus initialization
  mt76x0: remove mt76x0_vendor_reset routine
  mt76x0: remove mt76x0_vendor_single_wr routine
  mt76x0: remove mt76x0_mcu_msg_alloc routine
  mt76x0: use shared mt76 usb mcu completion
  mt76x0: remove mt76x0_complete_urb routine
  mt76x0: remove mt76x0_vendor_request routine
  mt76x0: remove unused mt76x0_wait_asic_ready routine
  mt76x0: use mt76u_mcu_send_msg utility routine to send fw cmds
  mt76x0: remove unused mt76x0_mcu structure
  mt76x0: use mt76u_mcu_fw_send_data for fw uploading
  mt76x0: remove unused routines for usb_buff alloc/free

 drivers/net/wireless/mediatek/mt76/mt76.h     |  14 +
 .../wireless/mediatek/mt76/mt76x0/Makefile    |   2 +-
 .../net/wireless/mediatek/mt76/mt76x0/core.c  |  34 --
 .../net/wireless/mediatek/mt76/mt76x0/dma.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt76x0/init.c  |   7 +-
 .../net/wireless/mediatek/mt76/mt76x0/mcu.c   | 343 +++---------------
 .../net/wireless/mediatek/mt76/mt76x0/mcu.h   |   1 -
 .../wireless/mediatek/mt76/mt76x0/mt76x0.h    |  21 --
 .../net/wireless/mediatek/mt76/mt76x0/usb.c   | 213 +----------
 .../net/wireless/mediatek/mt76/mt76x0/usb.h   |  15 -
 .../mediatek/mt76/mt76x2_init_common.c        |  11 +-
 drivers/net/wireless/mediatek/mt76/mt76x2u.h  |   1 -
 .../net/wireless/mediatek/mt76/mt76x2u_init.c |   2 +-
 .../net/wireless/mediatek/mt76/mt76x2u_mcu.c  |   8 -
 drivers/net/wireless/mediatek/mt76/usb_mcu.c  |  75 +++-
 15 files changed, 134 insertions(+), 619 deletions(-)
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/core.c

-- 
2.18.0
