Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC137C6FA83
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Sep 2022 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+Zi11NGz7yszxzsbPjLx/MnS4sftnpzTZ58eCD7bdo=; b=FqNLPxtjxjglKu4A7PUAC1RXHO
	u1B9RWvAYCdNEv96kb8n2wWVS7qrInejFI3HlbcN16TEnb/mblXUQB5vEnMtbLeysuY7Atczumudr
	1DBM/5VsG+/6MkDu/GkIC6hGXXIyhv1ShE1sgb7+f6OOKaGNejwjoqF7yLGpJ1/oIcR7t+yms83C9
	P3qO+14YHrtbS18ldhINesgTW2lQWs368W3GhRBKWxnfxs+aqb+7MVzZBjmw3qGDFKQAqndbucSTS
	MNnual1LHHYianta9e1ESmsGg4ZF84JSgIbmGI06acC/y+UPr9v7U9NTJ8zBjDp296fXtT+U9FJUM
	XcxxlHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXP3M-002qh8-ND; Sun, 11 Sep 2022 15:39:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXP1t-002phw-4a; Sun, 11 Sep 2022 15:37:55 +0000
X-UUID: 833ab40d996b4999b8b60d638e4a3b33-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/+Zi11NGz7yszxzsbPjLx/MnS4sftnpzTZ58eCD7bdo=;
	b=SFHdu7NtsS/bnqN57PK0OhXf02jbMGAPFuMX1vVpzUBydEQ5mPkb7gJNlJ+JQUmkOgB4zNCBAp2zoyzpa9isdQAnjflN+QCJlWr28YwrEfPMGmfDgZirZhjluaeGGbzfpVjRYZRkr0zRR8Gfx/Hj9EJ0fARPi4FEo8uRwhyZlvY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c28f52d6-3732-41c1-a123-3a385502d50d,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:414f06ec-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 833ab40d996b4999b8b60d638e4a3b33-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1754142363; Sun, 11 Sep 2022 08:37:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sun, 11 Sep 2022 23:37:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 11 Sep 2022 23:37:43 +0800
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
Subject: [PATCH v3 5/9] drm/mediatek: Add gamma support different lut_bits for other SoC
Date: Sun, 11 Sep 2022 23:37:30 +0800
Message-ID: <20220911153734.24243-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_083753_316977_B65E194D 
X-CRM114-Status: GOOD (  16.51  )
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
index e69d0b205b9a..155fb5d94d79 100644
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


