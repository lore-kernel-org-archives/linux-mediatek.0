From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v3 0/3] Add Mediatek SoC RTC driver
Date: Tue, 28 Apr 2015 15:35:53 +0800
Message-ID: <1430206556-18254-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Tomasz Figa <tfiga@google.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <kernel@pengutronix.de>
Cc: srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

RTC is one submodule of Mediatek MT6397 PMIC chip[1]. This series
support RTC driver that work with Mediatek SoC like MT8135, MT8173.
It implements second counter and also provide alarm function.

This series base on 4.1-rc1, Test ok on MT8173 platform.

[1] https://lkml.org/lkml/2015/1/23/325

Change in v3:
1. Replace magic number in mt6397-core.c
2. Add comment for some equation and write trigger.
3. Use regmap_bulk_read and regmap_bulk_write to avoid muliple regmap_r=
ead
   and regmap_write
4. Replace devm_request_threaded_irq with request_threaded_irq and add
   irq_dispose_mapping
5. Fix Tomasz Figa review comment.

Change in v2:
1. Move RTC address and interrupt to mt6397-core.c, and register
   these resource in mfd_cell.
   http://lists.infradead.org/pipermail/linux-arm-kernel/2015-February/=
323239.html
2. Remove dt-binding document due to register resouce in mfd_cell, not =
from
   device tree.
3. Update MAINTAINER file to add Mediatek RTC mainainter.
4. Add prefix mtk_ to some internal functions.
5. Fix racy condition
6. Check return value of regmap_read and regmap_write
7. Remove some unnecessary register readback, clear, then write.
8. Add disable alarm in mtk_rtc_set_alarm function
9. Fix Uwe Kleine-K=C3=B6nig review comment

Eddie Huang (2):
  mfd: provide RTC resource in MT6397 MFD
  MAINTAINERS: add Mediatek RTC driver

Tianping Fang (1):
  rtc: mediatek: Add MT6397 RTC driver

 MAINTAINERS               |   7 +
 drivers/mfd/mt6397-core.c |  18 +++
 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-mt6397.c  | 388 ++++++++++++++++++++++++++++++++++++++=
++++++++
 5 files changed, 424 insertions(+)
 create mode 100644 drivers/rtc/rtc-mt6397.c

--
1.8.1.1.dirty
