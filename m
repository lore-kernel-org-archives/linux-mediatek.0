From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V2 0/4] mfd: mediatek: add mt6323 support to the mt6397 driver
Date: Mon, 25 Jan 2016 11:14:43 +0100
Message-ID: <1453716887-38442-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

Changes in V2:
* send to proper maintainer
* add more people in Cc

John Crispin (4):
  dt-bindings: mfd: Add bindings for the MediaTek MT6323 PMIC
  mfd: mediatek: int_con and int_status may vary in location
  mfd: mediatek: add support for different Slave types
  mfd: mediatek: add MT6323 support to MT6397 driver

 Documentation/devicetree/bindings/mfd/mt6397.txt |   10 +-
 drivers/mfd/mt6397-core.c                        |   77 +++-
 include/linux/mfd/mt6323/core.h                  |   42 +++
 include/linux/mfd/mt6323/registers.h             |  414 ++++++++++++++++++++++
 include/linux/mfd/mt6397/core.h                  |    2 +
 5 files changed, 528 insertions(+), 17 deletions(-)
 create mode 100644 include/linux/mfd/mt6323/core.h
 create mode 100644 include/linux/mfd/mt6323/registers.h

-- 
1.7.10.4
