Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E75C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 09:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119A663225
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 09:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 119A663225
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3dRht/hzKQb1+GSJ1XNOrAU3ge+Cqa7WwHlzZrI7g4=; b=n/hNcko8H8vlMk
	xKww4IGx7A+gChdA+g+Hj8nXvKeWkXOwbh5BKWTh3AsPtraQp3raU+6+heSEarlRaR1Oq9Y5Blz3U
	nHRHH7PS7JgO1kBdzroo+OzAxVazGI2d4u/DmyMAG8ngtD+/NTbM5r+oMcLzpJ1hyauGLlguJZOcg
	jicUTXxs9b/kfYC3TJe0hFc8adACj+IakQpG40eZOt2uGYjEEajswqZZXwF6vPAvyDBTA3yHtZoaq
	PuU4rTWymsKIvqZd7jQlcMuCLRCwNjESBDstibWkHxb4KPgP6qXRK7Ckvgm1Zf1gmniqd3hUW1yaU
	J/TvOkS4VFww27sxWV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmv63-0010g2-Vf; Tue, 16 Nov 2021 09:49:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmv5z-0010ck-CI
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 09:49:45 +0000
X-UUID: 5916d66412934e7c975e158cf0de9e66-20211116
X-UUID: 5916d66412934e7c975e158cf0de9e66-20211116
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 271929755; Tue, 16 Nov 2021 02:49:39 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 01:49:38 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 16 Nov 2021 17:49:36 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 16 Nov 2021 17:49:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, <shuijing.li@mediatek.com>,
 <liangxu.xu@mediatek.com>, <xinlei.li@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Subject: [PATCH v3 2/2] drm/mediatek: control panel's power before MIPI LP11
Date: Tue, 16 Nov 2021 17:49:30 +0800
Message-ID: <20211116094930.11470-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20211116094930.11470-1-jitao.shi@mediatek.com>
References: <20211116094930.11470-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_014943_449501_FAB513C3 
X-CRM114-Status: GOOD (  15.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"auo,kd101n80-45na" requires the panel's IOVDD take precedence over
MIPI DATA. Otherwise there is a risk of leakage.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Change-Id: I2da6179dea7e15bc5a53fe36db200b6c04f4d551
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 93b40c245f00..9fff0c483139 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -24,7 +24,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-
+#include <drm/panel_boe_tv101wum_nl6.h>
 #include "mtk_disp_drv.h"
 #include "mtk_drm_ddp_comp.h"
 
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
+	struct drm_panel *panel;
 	struct phy *phy;
 
 	void __iomem *regs;
@@ -619,10 +620,16 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
 					  dsi->lanes);
 
+	if (dsi->panel) {
+		if (panel_prepare_power(dsi->panel)) {
+			DRM_INFO("can't prepare power the panel\n");
+			goto err_refcount;
+		}
+	}
 	ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set data rate: %d\n", ret);
-		goto err_refcount;
+		goto err_prepare_power;
 	}
 
 	phy_power_on(dsi->phy);
@@ -665,6 +672,11 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->engine_clk);
 err_phy_power_off:
 	phy_power_off(dsi->phy);
+err_prepare_power:
+	if (dsi->panel) {
+		if (panel_unprepare_power(dsi->panel))
+			DRM_INFO("Can't unprepare power the panel\n");
+	}
 err_refcount:
 	dsi->refcount--;
 	return ret;
@@ -698,6 +710,11 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->digital_clk);
 
 	phy_power_off(dsi->phy);
+
+	if (dsi->panel) {
+		if (panel_unprepare_power(dsi->panel))
+			DRM_INFO("Can't unprepare power the panel\n");
+	}
 }
 
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
@@ -1001,7 +1018,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int ret;
@@ -1019,12 +1035,12 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->next_bridge);
+					  &dsi->panel, &dsi->next_bridge);
 	if (ret)
 		goto err_unregister_host;
 
-	if (panel) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (dsi->panel) {
+		dsi->next_bridge = devm_drm_panel_bridge_add(dev, dsi->panel);
 		if (IS_ERR(dsi->next_bridge)) {
 			ret = PTR_ERR(dsi->next_bridge);
 			goto err_unregister_host;
-- 
2.12.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
