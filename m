From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v7 00/13] Mediatek MT8183 scpsys support
Date: Wed, 28 Aug 2019 17:11:33 +0800
Message-ID: <1566983506-26598-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This series is based on v5.3-rc1 with MT8183 SMI dt-binding patch v11[1].

[1] [v11,01/23] dt-bindings: mediatek: Add binding for mt8183 IOMMU and SMI
    (https://patchwork.kernel.org/patch/11112769/)

changes since v6:
- remove the patch of SPDX license identifier because it's already fixed

changes since v5:
- fix documentation in [PATCH 04/14]
- remove useless variable checking and reuse API of clock control in [PATCH 06/14]
- coding style fix of bus protection control in [PATCH 08/14]
- fix naming of new added data in [PATCH 09/14]
- small refactor of multiple step bus protection control in [PATCH 10/14]

changes since v4:
- add property to mt8183 smi-common
- seperate refactor patches and new add function
- add power controller device node

Weiyi Lu (13):
  dt-bindings: mediatek: Add property to mt8183 smi-common
  dt-bindings: soc: Add MT8183 power dt-bindings
  soc: mediatek: Refactor polling timeout and documentation
  soc: mediatek: Refactor regulator control
  soc: mediatek: Refactor clock control
  soc: mediatek: Refactor sram control
  soc: mediatek: Refactor bus protection control
  soc: mediatek: Add basic_clk_id to scp_power_data
  soc: mediatek: Add multiple step bus protection control
  soc: mediatek: Add subsys clock control for bus protection
  soc: mediatek: Add extra sram control
  soc: mediatek: Add MT8183 scpsys support
  arm64: dts: Add power controller device node of MT8183

 .../mediatek,smi-common.txt                   |   2 +-
 .../bindings/soc/mediatek/scpsys.txt          |  14 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  62 ++
 drivers/soc/mediatek/Makefile                 |   2 +-
 drivers/soc/mediatek/mtk-scpsys-ext.c         |  99 +++
 drivers/soc/mediatek/mtk-scpsys.c             | 575 +++++++++++++++---
 include/dt-bindings/power/mt8183-power.h      |  26 +
 include/linux/soc/mediatek/scpsys-ext.h       |  39 ++
 8 files changed, 741 insertions(+), 78 deletions(-)
 create mode 100644 drivers/soc/mediatek/mtk-scpsys-ext.c
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 create mode 100644 include/linux/soc/mediatek/scpsys-ext.h
