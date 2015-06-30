From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v2 0/2] Add mt6580 basic chip support
Date: Tue, 30 Jun 2015 15:02:29 +0800
Message-ID: <1435647751-20422-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: srv_wsdupstream@mediatek.com, cc.hwang@mediatek.com, linux-kernel@vger.kernel.org, jades.shih@mediatek.com, scott.shu@mediatek.com, miles.chen@mediatek.com, linux-mediatek@lists.infradead.org, my.chung@mediatek.com, yingjoe.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

This patch add basic support for Mediatek's new 4-core chip, mt6580.

Change in v2:
1. Use stdout-path in device tree to indicate console
2. Remove board-specific bootargs

Mars Cheng (2):
  Document: DT: Add bindings for mediatek MT6580 SoC Platform
  ARM: dts: mediatek: add 6580 support

 Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/mt6580-evbp1.dts                 |  35 ++++++
 arch/arm/boot/dts/mt6580.dtsi                      | 125 +++++++++++++++++++++
 4 files changed, 165 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt6580-evbp1.dts
 create mode 100644 arch/arm/boot/dts/mt6580.dtsi

--
1.8.1.1.dirty
