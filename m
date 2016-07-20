From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 4/4] drm/mediatek: adjust VENCPLL clock for 4K HDMI output
Date: Wed, 20 Jul 2016 12:03:05 +0800
Message-ID: <1468987385-37353-5-git-send-email-bibby.hsieh@mediatek.com>
References: <1468987385-37353-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468987385-37353-1-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

if MT8173 display module can support 4K HDMI output,
we have to adjust VENCPLL clock from default 660MHz
to 800MHz.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |    9 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b1223d5..f159189 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -23,6 +23,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
+#include <linux/clk.h>
 
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp.h"
@@ -363,6 +364,14 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	private->vencpll_clk = devm_clk_get(dev, "vencpll");
+	if (IS_ERR(private->vencpll_clk)) {
+		ret = PTR_ERR(private->vencpll_clk);
+		dev_err(dev, "Failed to get vencpll clock: %d\n", ret);
+		return ret;
+	}
+	clk_set_rate(private->vencpll_clk, 800000000);
+
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(dev->of_node->parent, node) {
 		const struct of_device_id *of_id;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index aa93894..273ad02 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -40,6 +40,7 @@ struct mtk_drm_private {
 	void __iomem *config_regs;
 	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
 	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
+	struct clk *vencpll_clk;
 
 	struct {
 		struct drm_atomic_state *state;
-- 
1.7.9.5
