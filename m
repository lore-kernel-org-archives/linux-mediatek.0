From: wangyan wang <wangyan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH V4 0/8] make mt7623 clock of hdmi stable
Date: Tue, 19 Feb 2019 17:31:07 +0800
Message-ID: <20190219093115.16449-1-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: wangyan wang <wangyan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Wangyan Wang <wangyan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

V4 adopt maintainer's suggestion.
Here is the change list between V3 & V4
1. add Reviewed-by:CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
in commit message.

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
