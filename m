Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDE1ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 02:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FArvZRmhdBvQysQdV1ORcIphRl/jyjsmb1ylCr+tMuo=; b=fr5TOSsJkhz3YzaNmA6q1rDcHe
	2eYc9SZcpeGeQKFswEsDu35BjsQp4sj3gEgxtzEULuYT7jE7yae1LTTgDSjjtzzk/q7GBXZSGjo91
	pM6b8TOFcFMS7Q0/CKs3moiu2I3mvlNrbUcorSahin0Fu8ndrh0TDdLk9ZMphJ4a5+EtitYI+RvGp
	RjBVtp9ImVAcxTRg7dCDrOlBS9q2D/hwTxVuP8GVXO+ZJU0yUGv466x2JFq0JzDwWi3LdbQNxtydM
	7dk9N5HbNn0rNksxdUImjVDQECTNr0F7oKKzXy6BHjWjy86aeWMj/rbtTScb0JE+Lf9HtXbsrj9Sg
	npEMDRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXYoi-006AAL-LX; Mon, 12 Sep 2022 02:04:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXYoW-006A3n-Gb; Mon, 12 Sep 2022 02:04:46 +0000
X-UUID: ae60a6a802df446ba6ff6c05d980f94e-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FArvZRmhdBvQysQdV1ORcIphRl/jyjsmb1ylCr+tMuo=;
	b=ckMkSobBWPVCLk+o1+FH1PSzsvUA/9alMnCdoedY1dfbZPg4eHjKuyx8tGLMjdgiYszxPCnbaTsFVULBWUWIeaIcjQ1UYtdKWBYsbWvdh9CFZedwlqyoRnbkcYHFOa/zXzu0KWi6LvCraTEoS4fKDlukLZjMJhvuE6RMyLQGpio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:91a55ded-61b5-4ef3-a283-f69e8c78983e,OB:-32
	768,LOB:0,IP:0,URL:-32768,TC:0,Content:0,EDM:-32768,RT:-32768,SF:-32768,FI
	LE:0,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:4bd8465d-5ed4-4e28-8b00-66ed9f042fbd,C
	OID:nil,Recheck:0,SF:nil,TC:nil,Content:0,EDM:nil,IP:nil,URL:nil,File:nil,
	Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ae60a6a802df446ba6ff6c05d980f94e-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1331189644; Sun, 11 Sep 2022 19:00:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 12 Sep 2022 09:30:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 09:30:07 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH RESEND v3 5/9] drm/mediatek: Add gamma support different lut_bits for other SoC
Date: Mon, 12 Sep 2022 09:30:02 +0800
Message-ID: <20220912013006.27541-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_190444_752224_B3742838 
X-CRM114-Status: GOOD (  16.09  )
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

Add lut_bits in gamma driver data for each SoC and adjust the usage
of lut_bits in mtk_drm_gamma_set_common().

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 36 ++++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 0a1022032b71..be82d15a5204 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -25,11 +25,14 @@
 
 #define LUT_10BIT_MASK				0x03ff
 #define LUT_SIZE_DEFAULT			512 /* for setting gamma lut from AAL */
+#define LUT_BITS_DEFAULT			10
+#define LUT_INPUT_BITS				16 /* input lut bit from application */
 
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
 	u16 lut_size;
+	u8 lut_bits;
 };
 
 /*
@@ -72,17 +75,23 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	bool lut_diff = false;
 	u16 lut_size = LUT_SIZE_DEFAULT;
+	u8 lut_bits = LUT_BITS_DEFAULT;
+	u8 shift_bits;
 	unsigned int i, reg;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
-	u32 word;
+	u32 word, mask;
 	u32 diff[3] = {0};
 
 	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
 		lut_size = gamma->data->lut_size;
+		lut_bits = gamma->data->lut_bits;
 	}
 
+	shift_bits = LUT_INPUT_BITS - lut_bits;
+	mask = GENMASK(lut_bits - 1, 0);
+
 	if (state->gamma_lut) {
 		reg = readl(regs + DISP_GAMMA_CFG);
 		reg = reg | GAMMA_LUT_EN;
@@ -92,17 +101,20 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		for (i = 0; i < lut_size; i++) {
 
 			if (!lut_diff || (i % 2 == 0)) {
-				word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-					(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-					((lut[i].blue >> 6) & LUT_10BIT_MASK);
+				word = (((lut[i].red >> shift_bits) & mask) << 20) +
+					(((lut[i].green >> shift_bits) & mask) << 10) +
+					((lut[i].blue >> shift_bits) & mask);
 			} else {
-				diff[0] = (lut[i].red >> 6) - (lut[i - 1].red >> 6);
-				diff[1] = (lut[i].green >> 6) - (lut[i - 1].green >> 6);
-				diff[2] = (lut[i].blue >> 6) - (lut[i - 1].blue >> 6);
-
-				word = ((diff[0] & LUT_10BIT_MASK) << 20) +
-					((diff[1] & LUT_10BIT_MASK) << 10) +
-					(diff[2] & LUT_10BIT_MASK);
+				diff[0] = (lut[i].red >> shift_bits) -
+					  (lut[i - 1].red >> shift_bits);
+				diff[1] = (lut[i].green >> shift_bits) -
+					  (lut[i - 1].green >> shift_bits);
+				diff[2] = (lut[i].blue >> shift_bits) -
+					  (lut[i - 1].blue >> shift_bits);
+
+				word = ((diff[0] & mask) << 20) +
+					((diff[1] & mask) << 10) +
+					(diff[2] & mask);
 			}
 			writel(word, (lut_base + i * 4));
 		}
@@ -209,11 +221,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
 	.lut_size = 512,
+	.lut_bits = 10,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_diff = true,
 	.lut_size = 512,
+	.lut_bits = 10,
 };
 
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
-- 
2.18.0


