From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] Add Apple Carplay driver
Date: Wed, 14 Mar 2018 14:02:35 +0800
Message-ID: <1521007356-12306-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-mediatek@lists.infradead.org

>From bf48dcd9cb254576cfea373c9a5d2ab996408895 Mon Sep 17 00:00:00 2001
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Tue, 13 Mar 2018 11:47:38 +0800
Subject: [PATCH] Add Apple Carplay driver

Some Apple devices which support Carplay can enter USB Host Mode from USB
Device Mode after receiving a specific USB Vendor Request. There is a
requirement apply to accesssories that support the USB dual role switch
feature, and must have a USB-A receptacle that is capable of functioning
in both USB Host and USB Device roles.
It means that the driver should supports manual Dual-Role switch, due to
no IDDIG pin is avaliable.

There is no suitable place to add this spicific USB Vendor Request, so
here I extract a single driver which allow user force to send it by a debug
interface when need it, and keep it independent on USB Dual-Role Controller
Drivers.
But to implement carplay feature, there are some requirments for USB Dual-Role
Driver:
1. supports manual dual-role switch, such as, by a debug interface;
2. keep vbus alive even when switch host into device mode;

More information please refer to "Chapter 46. USB Role Switch" in
MFI Accessroy Interface Specification.pdf

Chunfeng Yun (1):
  usb: misc: supports Apple Carplay driver

 drivers/usb/misc/Kconfig   |    9 +++
 drivers/usb/misc/Makefile  |    1 +
 drivers/usb/misc/carplay.c |  193 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+)
 create mode 100644 drivers/usb/misc/carplay.c

-- 
1.7.9.5
