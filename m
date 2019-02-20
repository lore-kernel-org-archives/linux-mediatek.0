From: wangyan wang <wangyan.wang@mediatek.com>
Subject: [PATCH V5 0/8] make mt7623 clock of hdmi stable
Date: Wed, 20 Feb 2019 10:53:49 +0800
Message-ID: <20190220025357.7354-1-wangyan.wang@mediatek.com>
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
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, wangyan wang <wangyan.wang@mediatek.com>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Wangyan Wang <wangyan.wang@mediatek.com>

V4 adopt maintainer's suggestion.
Here is the change list between V4 & V5
1. add Reviewed-by:CK Hu <ck.hu@mediatek.com>
in " drm/mediatek: fix the rate ..." commit message.

2. describe the reason why mt7623 clock of hdmi 
is more stable than before.
the tvdpll should be stable in hdmi normal setting
to guarantee clock of hdmi stable, but the tvdpll 
may be changed in original code ,the patch is to
deal with the problem, you can find more descriptions
in patch "drm/mediatek:using different flags of clk ...".


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
