From: wangyan wang <wangyan.wang@mediatek.com>
Subject: [PATCH V6 0/8] make mt7623 clock of hdmi stable
Date: Mon, 25 Feb 2019 10:09:04 +0800
Message-ID: <20190225020912.29120-1-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: wangyan wang <wangyan.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

From: Wangyan Wang <wangyan.wang@mediatek.com>

V6 adopt maintainer's suggestion.
Here is the change list between V5 & V6
1. change "unsigned char mux_flags;" to "u8 mux_flags;" to
match with the struct in " clk: mediatek: add MUX_GATE_FLAGS_2".


chunhui dai (8):
  drm/mediatek: recalculate hdmi phy clock of MT2701 by querying
    hardware
  drm/mediatek: move the setting of fixed divider
  drm/mediatek: using different flags of clk for HDMI phy
  drm/mediatek: fix the rate and divder of hdmi phy for MT2701
  clk: mediatek: add MUX_GATE_FLAGS_2
  clk: mediatek: using CLK_MUX_ROUND_CLOSEST for the clock of dpi1_sel
  drm/mediatek: using new factor for tvdpll in MT2701
  drm/mediatek: fix the rate of parent for hdmi phy in MT2701

 drivers/clk/mediatek/clk-mt2701.c              |  4 +-
 drivers/clk/mediatek/clk-mtk.c                 |  2 +-
 drivers/clk/mediatek/clk-mtk.h                 | 20 ++++++---
 drivers/gpu/drm/mediatek/mtk_dpi.c             |  8 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 34 ++++------------
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        |  7 +---
 drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 56 +++++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c | 23 +++++++++++
 8 files changed, 102 insertions(+), 52 deletions(-)

-- 
2.14.1
