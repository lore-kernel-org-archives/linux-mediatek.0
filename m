Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CD6C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRPNxGzXlg+mwfqc/hmjiNSIySOo6Qi3MDyq9ozazxE=; b=Mdw3zLg3e/8upY8G6nFZnZqsM0
	IPWqgq5AiXeaa+ttFQvzs03TQiX4a1f5G8wdQ0lI06SluwdvYWphs5RMBekE2S+mGzCTEpi/kXItT
	qkrdjqfEsdHYL7PwfqiDW1hD0Z/vRHSES7EE3zE1zICN+j7eZhisErVr6oo7qFSfibAi5x2NWlptz
	Nu0IYKGxkfc0o7tYsWlz9cikK3N+J09M451QjTtxJkOaZdqXk9nYMI03fY3lkigGOd+UMzTG5sTmX
	Q8BRvxz2ngf0DalBgERHo+BdfqWqYbnValY+0r/bhGPuehYpsldmHZ8JVk3pwcRrKa4cmTs1Q3zrv
	ZXM2fZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ4YL-007TVs-B5; Mon, 22 Aug 2022 10:21:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ4Y9-007TML-0y; Mon, 22 Aug 2022 10:20:55 +0000
X-UUID: 1fd8b52b24a24105a9b39a33c63c7399-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sRPNxGzXlg+mwfqc/hmjiNSIySOo6Qi3MDyq9ozazxE=;
	b=tYQjvKbxc7XFYyUBWJN52z7R8Umqg9Zxga6Bi0u9RFV8Lmke7sqrgPQJAIOPsJxqqRcValxLRsnQyDvrBms+qomuKLylmnUIhZK4x7uQeJrPpV3rkuIaMeIfkQbcDuKyjNk0yHeO2rdsgs8aJixW6Pt9GrURo5kBbqzww3XqK4s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:21777cca-5672-4847-92f6-9484339679f3,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:cd0eed67-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1fd8b52b24a24105a9b39a33c63c7399-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 833910717; Mon, 22 Aug 2022 03:20:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 17:20:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Aug 2022 17:20:10 +0800
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, zheng-yan.chen
	<zheng-yan.chen@mediatek.com>
Subject: [PATCH 2/3] drm/mediatek: Add gamma lut support for mt8195
Date: Mon, 22 Aug 2022 17:19:44 +0800
Message-ID: <20220822091945.21343-3-zheng-yan.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_032053_105912_04B715DA 
X-CRM114-Status: GOOD (  24.65  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since the previous gamma_set_common() function is designed for
9bit-to-10bit conversion, which is not feasible for the
10bit-to-12bit conversion in mt8195.

Update the function to fit the need of mt8195.

Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>

---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 97 ++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  2 +
 8 files changed, 83 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 0f9d7efb61d7..f46d4ab73d6a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
 
 	if (aal->data && aal->data->has_gamma)
-		mtk_gamma_set_common(aal->regs, state, false);
+		mtk_gamma_set_common(aal->regs, state);
 }
 
 void mtk_aal_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 33e61a136bbc..b662bf8b1c9d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -51,8 +51,9 @@ void mtk_gamma_clk_disable(struct device *dev);
 void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+unsigned int mtk_gamma_size(struct device *dev);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff);
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index bbd558a036ec..a842e5e1962e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -18,18 +18,26 @@
 #define DISP_GAMMA_EN				0x0000
 #define GAMMA_EN					BIT(0)
 #define DISP_GAMMA_CFG				0x0020
+#define RELAY_MODE					BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
+#define DISP_GAMMA_BANK				0x0100
 #define DISP_GAMMA_LUT				0x0700
-
+#define DISP_GAMMA_LUT1				0x0b00
 #define LUT_10BIT_MASK				0x03ff
-
+#define TABLE_9BIT_SIZE				512
+#define LUT_12BIT_MASK				0x0fff
+#define TABLE_10BIT_SIZE			1024
+#define BANK_SIZE				256
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	unsigned int lut_size;
 };
 
+static unsigned int now_lut_size;
+static bool now_lut_diff;
 /*
  * struct mtk_disp_gamma - DISP_GAMMA driver structure
  */
@@ -54,40 +62,73 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff)
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
 {
-	unsigned int i, reg;
-	struct drm_color_lut *lut;
+	unsigned int i, reg, idx;
 	void __iomem *lut_base;
-	u32 word;
-	u32 diff[3] = {0};
+	void __iomem *lut1_base;
+	u32 word, word1;
 
 	if (state->gamma_lut) {
+		u32 table_size;
+		u32 mask;
+		struct drm_color_lut color, even, odd;
+		struct drm_color_lut *lut = (struct drm_color_lut *)state->gamma_lut;
+		bool lut_12bit = (now_lut_size == TABLE_10BIT_SIZE);
+
 		reg = readl(regs + DISP_GAMMA_CFG);
+		reg = reg & ~RELAY_MODE;
 		reg = reg | GAMMA_LUT_EN;
 		writel(reg, regs + DISP_GAMMA_CFG);
 		lut_base = regs + DISP_GAMMA_LUT;
-		lut = (struct drm_color_lut *)state->gamma_lut->data;
-		for (i = 0; i < MTK_LUT_SIZE; i++) {
+		lut1_base = regs + DISP_GAMMA_LUT1;
+		if (lut_12bit) {
+			table_size = TABLE_10BIT_SIZE;
+			mask = LUT_12BIT_MASK;
+		} else {
+			table_size = TABLE_9BIT_SIZE;
+			mask = LUT_10BIT_MASK;
+		}
 
-			if (!lut_diff || (i % 2 == 0)) {
-				word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-					(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-					((lut[i].blue >> 6) & LUT_10BIT_MASK);
+		for (i = 0; i < table_size; i++) {
+			if (!(i % BANK_SIZE) && lut_12bit)
+				writel((i / BANK_SIZE), regs + DISP_GAMMA_BANK);
+
+			color.red = (lut[i].red >> 6) & mask;
+			color.green = (lut[i].green >> 6) & mask;
+			color.blue = (lut[i].blue >> 6) & mask;
+			if ((i % 2) && now_lut_diff) {
+				odd = color;
+				word = (lut_12bit) ? (((odd.green - even.green) << 12) +
+						      (odd.red - even.red))
+						   : (((odd.red - even.red) << 20) +
+						      ((odd.green - even.green) << 10) +
+						      (odd.blue - even.blue));
+				word1 = (odd.blue - even.blue);
 			} else {
-				diff[0] = (lut[i].red >> 6) - (lut[i - 1].red >> 6);
-				diff[1] = (lut[i].green >> 6) - (lut[i - 1].green >> 6);
-				diff[2] = (lut[i].blue >> 6) - (lut[i - 1].blue >> 6);
-
-				word = ((diff[0] & LUT_10BIT_MASK) << 20) +
-					((diff[1] & LUT_10BIT_MASK) << 10) +
-					(diff[2] & LUT_10BIT_MASK);
+				even = color;
+				word =  (lut_12bit) ? ((even.green << 12) + even.red)
+						    : ((even.red << 20) +
+						       (even.green << 10) + even.blue);
+				word1 = even.blue;
 			}
-			writel(word, (lut_base + i * 4));
+			idx = (lut_12bit) ? (i % BANK_SIZE) : i;
+			writel(word, (lut_base + idx * 4));
+			if (lut_12bit)
+				writel(word1, (lut1_base + idx * 4));
 		}
 	}
 }
 
+unsigned int mtk_gamma_size(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	if (gamma->data)
+		return gamma->data->lut_size;
+	else
+		return 0;
+}
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
@@ -95,8 +136,7 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 
 	if (gamma->data)
 		lut_diff = gamma->data->lut_diff;
-
-	mtk_gamma_set_common(gamma->regs, state, lut_diff);
+	mtk_gamma_set_common(gamma->regs, state);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
@@ -178,6 +218,8 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 	ret = component_add(dev, &mtk_disp_gamma_component_ops);
 	if (ret)
 		dev_err(dev, "Failed to add component: %d\n", ret);
+	now_lut_size = priv->data->lut_size;
+	now_lut_diff = priv->data->lut_diff;
 
 	return ret;
 }
@@ -191,10 +233,17 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_diff = true,
+	.lut_size = 512,
+};
+
+static const struct mtk_disp_gamma_data mt8195_gamma_driver_data = {
+	.lut_diff = true,
+	.lut_size = 1024,
 };
 
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
@@ -202,6 +251,8 @@ static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
 	  .data = &mt8173_gamma_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = &mt8183_gamma_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-gamma",
+	  .data = &mt8195_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 42cc7052b050..2a6513259562 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -930,9 +930,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		mtk_crtc->ddp_comp[i] = comp;
 
 		if (comp->funcs) {
-			if (comp->funcs->gamma_set)
-				gamma_lut_size = MTK_LUT_SIZE;
-
+			if (comp->funcs->gamma_set && comp->funcs->gamma_size)
+				gamma_lut_size = comp->funcs->gamma_size(comp->dev);
 			if (comp->funcs->ctm_set)
 				has_ctm = true;
 		}
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index cb9a36c48d4f..1799853ef89a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -10,7 +10,6 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_plane.h"
 
-#define MTK_LUT_SIZE	512
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 2d72cc5ddaba..4c6538a17b88 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -323,6 +323,7 @@ static const struct mtk_ddp_comp_funcs ddp_gamma = {
 	.clk_enable = mtk_gamma_clk_enable,
 	.clk_disable = mtk_gamma_clk_disable,
 	.gamma_set = mtk_gamma_set,
+	.gamma_size = mtk_gamma_size,
 	.config = mtk_gamma_config,
 	.start = mtk_gamma_start,
 	.stop = mtk_gamma_stop,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 2d0052c23dcb..bf0cf7f86010 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -59,6 +59,7 @@ struct mtk_ddp_comp_funcs {
 	void (*disable_vblank)(struct device *dev);
 	unsigned int (*supported_rotations)(struct device *dev);
 	unsigned int (*layer_nr)(struct device *dev);
+	unsigned int (*gamma_size)(struct device *dev);
 	int (*layer_check)(struct device *dev,
 			   unsigned int idx,
 			   struct mtk_plane_state *state);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0e4c77724b05..473766be56e1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -567,6 +567,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8195-disp-gamma",
+	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8195-disp-merge",
 	  .data = (void *)MTK_DISP_MERGE },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
-- 
2.18.0


