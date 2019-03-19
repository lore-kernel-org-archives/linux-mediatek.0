From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v5 00/14] Mediatek MT8183 scpsys support
Date: Tue, 19 Mar 2019 16:01:26 +0800
Message-ID: <20190319080140.24055-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Resend scpsys patches from v4[1].
Based on v5.1-rc1 with MT8183 dts v9 patch[2] and
MT8183 SMI dt-binding v6 patch[3].

[1] https://patchwork.kernel.org/patch/10792071/
[2] https://patchwork.kernel.org/patch/10856987/
[3] https://patchwork.kernel.org/patch/10816827/

changes since v4:
- add property to mt8183 smi-common
- seperate refactor patches and new add function
- add power controller device node

Weiyi Lu (14):
  dt-bindings: mediatek: Add property to mt8183 smi-common
  dt-bindings: soc: Add MT8183 power dt-bindings
  soc: mediatek: Switch to SPDX license identifier
  soc: mediatek: Refactor polling timeout and documentation
  soc: mediatek: Refactor regulator control
  soc: mediatek: Refactor clock control
  soc: mediatek: Refactor sram control
  soc: mediatek: Refactor bus protection control
  soc: mediatek: Add basic_clk_name to scp_power_data
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
 drivers/soc/mediatek/mtk-scpsys.c             | 603 +++++++++++++++---
 include/dt-bindings/power/mt8183-power.h      |  26 +
 include/linux/soc/mediatek/scpsys-ext.h       |  39 ++
 8 files changed, 757 insertions(+), 90 deletions(-)
 create mode 100644 drivers/soc/mediatek/mtk-scpsys-ext.c
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 create mode 100644 include/linux/soc/mediatek/scpsys-ext.h
