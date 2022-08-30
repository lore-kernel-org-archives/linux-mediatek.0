Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE16ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPDlpar6nYJpGX10K9C8kao91j0rYcpixjfathdC4g8=; b=0/ZyQJfCuOYFu7uoLG/DXpH0Wo
	pEvgvjELq3uWxjogrJD3NkMwGh7ZDdSc309sLjRZlg0gKv2CPNBlJxhTNQAIyszsnTRIIDsojMxY2
	Hng2sO7WtYb92Q38SATRG2uKVmngkkFDxMNIR1kvDGm+aYcS9DuDkiSxUVCw1MPLZmvdq9bkMQ+kQ
	RGGlOgyh5JZ8b1BLPGzq8EX86qDwITlDAd35mkfek3AjVXrjOobsxgnsCvDFNY6OeXd1wpjmAV7bF
	SwNGbNbHslF1LQz5HarTqv767Pib2BdYYrahDEpc8Ot3gPB6VVwhfHN8NZ9nEofElYdSXNdf9m/d6
	DDHToCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuvA-00ETog-Jr; Tue, 30 Aug 2022 06:40:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuuf-00ETXG-8g; Tue, 30 Aug 2022 06:39:55 +0000
X-UUID: d1d884ba5d28467fb186aaa42bc8606b-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xPDlpar6nYJpGX10K9C8kao91j0rYcpixjfathdC4g8=;
	b=uPt0WZ8J2LVNueQhrKHP/2lk8zPWehGJACArirexgGR1Wca9floTnHukNZU2R92TaZ05hBWEDHF73EGkM5qKUsiASW3SZX/Rr3s34/z0442DrY+U+W0Yh3TaK0RqaeIDDzaw1dC1ZpVopI1RZjV+sXotQatWcTGwLRE51xa1M7w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:79622256-5cdb-4223-ae76-4ffad1768cc3,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:17c8fb55-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d1d884ba5d28467fb186aaa42bc8606b-20220829
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1373578134; Mon, 29 Aug 2022 23:39:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 30 Aug 2022 14:39:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 30 Aug 2022 14:39:32 +0800
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
Subject: [PATCH v2 2/3] drm/mediatek: Add gamma lut support for mt8195
Date: Tue, 30 Aug 2022 14:39:28 +0800
Message-ID: <20220830063929.13390-3-zheng-yan.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_233953_337736_B93A4A6E 
X-CRM114-Status: GOOD (  24.50  )
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

Fixes: 7266e90a51a3 ("drm/mediatek: Add mediatek-drm of vdosys0 support for mt8195")
Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 102 +++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   2 +
 8 files changed, 85 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 0f9d7efb61d7..f563eee3c330 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
 
 	if (aal->data && aal->data->has_gamma)
-		mtk_gamma_set_common(aal->regs, state, false);
+		mtk_gamma_set_common(aal->regs, state, dev);
 }
 
 void mtk_aal_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 33e61a136bbc..c1269fce9a66 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -51,8 +51,9 @@ void mtk_gamma_clk_disable(struct device *dev);
 void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+unsigned int mtk_gamma_size(struct device *dev);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff);
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, struct device *dev);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index bbd558a036ec..0409e15fceb3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -18,18 +18,22 @@
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
-#define LUT_10BIT_MASK				0x03ff
-
+#define DISP_GAMMA_LUT1				0x0b00
+#define TABLE_9BIT_SIZE				512
+#define TABLE_10BIT_SIZE			1024
+#define BANK_SIZE				256
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	unsigned int lut_size;
+	unsigned int lut_bits;
 };
-
 /*
  * struct mtk_disp_gamma - DISP_GAMMA driver structure
  */
@@ -54,40 +58,75 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff)
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, struct device *dev)
 {
-	unsigned int i, reg;
-	struct drm_color_lut *lut;
+	unsigned int i, reg, idx;
 	void __iomem *lut_base;
-	u32 word;
-	u32 diff[3] = {0};
+	void __iomem *lut1_base;
+	u32 word, word1;
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 
 	if (state->gamma_lut) {
+		u32 table_size;
+		u32 mask;
+		u32 lut_bits;
+		u32 shift_bits;
+		bool lut_diff;
+		struct drm_color_lut color, color_rec;
+		struct drm_color_lut *lut = (struct drm_color_lut *)state->gamma_lut;
+
+		table_size = gamma->data->lut_size;
+		lut_bits = gamma->data->lut_bits;
+		lut_diff = gamma->data->lut_diff;
+		shift_bits = (lut_bits == 12) ? 4 : 6;
+		mask = GENMASK(lut_bits - 1, 0);
 		reg = readl(regs + DISP_GAMMA_CFG);
+		reg = reg & ~RELAY_MODE;
 		reg = reg | GAMMA_LUT_EN;
 		writel(reg, regs + DISP_GAMMA_CFG);
 		lut_base = regs + DISP_GAMMA_LUT;
-		lut = (struct drm_color_lut *)state->gamma_lut->data;
-		for (i = 0; i < MTK_LUT_SIZE; i++) {
-
-			if (!lut_diff || (i % 2 == 0)) {
-				word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-					(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-					((lut[i].blue >> 6) & LUT_10BIT_MASK);
+		lut1_base = regs + DISP_GAMMA_LUT1;
+		for (i = 0; i < table_size; i++) {
+			color.red = (lut[i].red >> shift_bits) & mask;
+			color.green = (lut[i].green >> shift_bits) & mask;
+			color.blue = (lut[i].blue >> shift_bits) & mask;
+			if (lut_diff && (i % 2)) {
+				word = (lut_bits == 12) ?
+						      (((color.green - color_rec.green) << 12) +
+						      (color.red - color_rec.red))
+							:
+						      (((color.red - color_rec.red) << 20) +
+						      ((color.green - color_rec.green) << 10) +
+						      (color.blue - color_rec.blue));
+				word1 = (color.blue - color_rec.blue);
 			} else {
-				diff[0] = (lut[i].red >> 6) - (lut[i - 1].red >> 6);
-				diff[1] = (lut[i].green >> 6) - (lut[i - 1].green >> 6);
-				diff[2] = (lut[i].blue >> 6) - (lut[i - 1].blue >> 6);
-
-				word = ((diff[0] & LUT_10BIT_MASK) << 20) +
-					((diff[1] & LUT_10BIT_MASK) << 10) +
-					(diff[2] & LUT_10BIT_MASK);
+				word = (lut_bits == 12) ?
+						      ((color.green << 12) + color.red)
+							:
+						      ((color.red << 20) +
+						      (color.green << 10) + color.blue);
+				word1 = color.blue;
+				color_rec = color;
 			}
-			writel(word, (lut_base + i * 4));
+			idx = (lut_bits == 12) ? (i % BANK_SIZE) : i;
+			writel(word, (lut_base + idx * 4));
+			if (!(i % BANK_SIZE) && lut_bits == 12)
+				writel((i / BANK_SIZE), regs + DISP_GAMMA_BANK);
+			if (lut_bits == 12)
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
@@ -95,8 +134,7 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 
 	if (gamma->data)
 		lut_diff = gamma->data->lut_diff;
-
-	mtk_gamma_set_common(gamma->regs, state, lut_diff);
+	mtk_gamma_set_common(gamma->regs, state, dev);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
@@ -191,10 +229,20 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_size = 512,
+	.lut_bits = 10,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_diff = true,
+	.lut_size = 512,
+	.lut_bits = 10,
+};
+
+static const struct mtk_disp_gamma_data mt8195_gamma_driver_data = {
+	.lut_diff = true,
+	.lut_size = 1024,
+	.lut_bits = 12,
 };
 
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
@@ -202,6 +250,8 @@ static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
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


