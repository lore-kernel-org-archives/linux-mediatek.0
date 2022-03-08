Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B10C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MTnRjPG7+ieHUd3IbNwuc0rzmlMGpMFN0CGNj5v1GQ=; b=yFLPHoCj0ZcfU0
	p3A0EYCZdAowgTmvtth+X+mfAkk+O9o2BduHTdGgwIesMKPyq3e3MoMVrNM2dj+cFetHQcfUZlq61
	A7GhCGbYg3zr5IxGt04r0DBl/xXFUbxID5x0UaPoVnRr23X+wieC0J5h9ZN6/h8aXt2wcne+C3h+R
	3xeM0j81T0dl7Kn4F11bJlkJOPfsjcIiqsWPj+cLtXrRY0ga7LkyMDP4WibN3hx1Ytu70iQOhlK1l
	6ABozWltYX1G1jiE91JVW4VLYsShKg+jg97YooAN4yV0jVyKjIe9PjOVHfimW+wMaPdDvifw74FhS
	oFBaTa/kEKuU78T7EgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWHm-003Wka-5F; Tue, 08 Mar 2022 09:37:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWDs-003Uto-Re; Tue, 08 Mar 2022 09:33:43 +0000
X-UUID: 92afb33d18264541b38f03af6e28b7ac-20220308
X-UUID: 92afb33d18264541b38f03af6e28b7ac-20220308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 390276244; Tue, 08 Mar 2022 02:33:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 01:30:22 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 17:30:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 17:30:20 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [RESEND v13 06/22] soc: mediatek: mmsys: modify reset controller for
 MT8195 vdosys1
Date: Tue, 8 Mar 2022 17:30:02 +0800
Message-ID: <20220308093018.24189-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308093018.24189-1-nancy.lin@mediatek.com>
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_013340_972085_84CA83D0 
X-CRM114-Status: GOOD (  14.70  )
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

MT8195 vdosys1 has more than 32 reset bits and a different reset base
than other chips. Modify mmsys for support 64 bit and different reset
base.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h |  1 +
 drivers/soc/mediatek/mtk-mmsys.c    | 20 +++++++++++++++-----
 drivers/soc/mediatek/mtk-mmsys.h    |  1 +
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 8b7adbd22919..fafe7c639b52 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -139,6 +139,7 @@
 #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
 #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
 
+#define MT8195_VDO1_SW0_RST_B		0x1d0
 #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
 #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
 #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index c686b17ca62f..f36e41b2df82 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -20,6 +20,8 @@
 #include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -51,6 +53,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
@@ -58,6 +61,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.routes = mmsys_mt8183_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
@@ -65,6 +69,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.routes = mmsys_mt8186_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -85,6 +90,8 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 	.config = mmsys_mt8195_config_table,
 	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
+	.sw0_rst_offset = MT8195_VDO1_SW0_RST_B,
+	.num_resets = 64,
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
@@ -143,18 +150,22 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 {
 	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
 	unsigned long flags;
+	u32 offset;
 	u32 reg;
 
+	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
+	id = id % MMSYS_SW_RESET_PER_REG;
+
 	spin_lock_irqsave(&mmsys->lock, flags);
 
-	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
+	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset + offset);
 
 	if (assert)
 		reg &= ~BIT(id);
 	else
 		reg |= BIT(id);
 
-	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
+	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset + offset);
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
@@ -250,10 +261,11 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mmsys->data = of_device_get_match_data(&pdev->dev);
 	spin_lock_init(&mmsys->lock);
 
 	mmsys->rcdev.owner = THIS_MODULE;
-	mmsys->rcdev.nr_resets = 32;
+	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
 	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
 	mmsys->rcdev.of_node = pdev->dev.of_node;
 	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
@@ -262,8 +274,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mmsys->data = of_device_get_match_data(&pdev->dev);
-
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
 	if (ret)
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 78c7069bac0e..013639e34617 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -99,6 +99,7 @@ struct mtk_mmsys_driver_data {
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
+	const u32 num_resets;
 	const struct mtk_mmsys_config *config;
 	const unsigned int num_configs;
 };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
