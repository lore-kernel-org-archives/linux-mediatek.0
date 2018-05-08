From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 6/7] drm/mediatek: add a error return value when clock driver has been prepared
Date: Tue, 8 May 2018 10:20:56 +0800
Message-ID: <20180508022057.29379-7-bibby.hsieh@mediatek.com>
References: <20180508022057.29379-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180508022057.29379-1-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

DRM driver get the comp->clk by of_clk_get(), we only
assign NULL to comp->clk when error happened, but do
not return the error number.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 4672317e3ad1..d38a5303f8fc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -283,7 +283,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	comp->irq = of_irq_get(node, 0);
 	comp->clk = of_clk_get(node, 0);
 	if (IS_ERR(comp->clk))
-		comp->clk = NULL;
+		return PTR_ERR(comp->clk);
 
 	/* Only DMA capable components need the LARB property */
 	comp->larb_dev = NULL;
-- 
2.12.5
