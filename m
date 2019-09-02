From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1 0/3] Runtime PM support for MT8183 mcucfg clock provider
Date: Mon, 2 Sep 2019 16:35:07 +0800
Message-ID: <1567413310-2589-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, CK Hu <ck.hu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This series is based on v5.3-rc1 and Mediatek MT8183 scpsys support v7[1].
Since Runtime PM is supported in Common Clock Framework which keeps
clock controller's power domain enabled to ensure clock status accessing correctly.

[1] https://patchwork.kernel.org/cover/11118371/

---

Weiyi Lu (3):
  clk: mediatek: Register clock gate with device
  clk: mediatek: Runtime PM support for MT8183 mcucfg clock provider
  arm64: dts: Add power-domains properity to mfgcfg

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  1 +
 drivers/clk/mediatek/clk-gate.c          |  5 +++--
 drivers/clk/mediatek/clk-gate.h          |  3 ++-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c |  7 +++++--
 drivers/clk/mediatek/clk-mtk.c           | 16 +++++++++++++---
 drivers/clk/mediatek/clk-mtk.h           |  5 +++++
 6 files changed, 29 insertions(+), 8 deletions(-)
