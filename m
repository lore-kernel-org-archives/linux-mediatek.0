Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A96C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rH+UkxEi1Z7bJ3WfdYgmFShAG5H1/LHJZpi2TKTF870=; b=0EmTm6aGqmgzgCIIcmUk4Eoq2A
	oBgiikfi63YK4fwXCrZWr7YJm11gitilznxP7LT/cwyhAzofoG3JdP7R7p/p4MNHQeeObjrQuczvy
	ZkfK1Fu9T5qtYIzp55I0JMt/DhrvY/FfDdELIK7wit6dPzxNqz7ySPJBV0dD/hEb9HdmfAkYlxW9A
	kHdC60AbyPoT43K384N47uUr0y9zsde0rYT/uBFuhTUJxn7falkXs/5UU2FEKA1zQraSstgTiUiMd
	5dCsxpmTqine0nYmEUSBDkXlgJpaCSdnGmY4fINF5Tc087PhjLczoI5qBG7eevMcG17TSNnBQs4/I
	rkv9EODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbCS-00Ccms-06;
	Thu, 18 May 2023 10:49:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbC1-00CcMQ-1f;
	Thu, 18 May 2023 10:49:11 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6452D660595F;
	Thu, 18 May 2023 11:49:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684406948;
	bh=rKgHMwiheReNnV5THzxEtK2wM9P+5w4x/hmo5YS+nus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNRasjw2noeeN3pOd+vRKEMuFxYOCM/8EXVfTqMvOIMx96IGOqEng1EZS6JctgUpJ
	 bgi2FWjRbZggLFtsc1lUdVae53ei1nYI6QjtqDvZ4yBuFjLz8Lo4uUdABnrl1+VaSI
	 DfnPQRaQyUpHcFaMy943gAgYD4LKjZoowOCgoNmQ+3JPPeK4OcJPylawN33FTNWVFk
	 CqM73aHdJ8V35zGD8x7WTKrv3Bpmqin8nv/NzhZB5HOsN30/uqXPTQfR7qEqocsb3s
	 2/lb38pj3jLp6m/jQdaO39YcuJhgUdIuSnjrK9eJ2uCOiK+WUl/Z9Hu7Klu3LdNYdw
	 htKiy4kLLPf2Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: [PATCH v4 07/11] drm/mediatek: gamma: Support specifying number of bits per LUT component
Date: Thu, 18 May 2023 12:48:53 +0200
Message-Id: <20230518104857.124265-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518104857.124265-1-angelogioacchino.delregno@collabora.com>
References: <20230518104857.124265-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_034909_682614_4D636962 
X-CRM114-Status: GOOD (  13.81  )
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

New SoCs, like MT8195, not only may support bigger lookup tables, but
have got a different register layout to support bigger precision:
support specifying the number of `lut_bits` for each SoC and use it
in mtk_gamma_set_common() to perform the right calculation.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index ed2aa1fb0171..62e1e50d2671 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -39,6 +39,7 @@ struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
 	u16 lut_size;
+	u8 lut_bits;
 };
 
 /*
@@ -84,6 +85,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	void __iomem *lut_base;
 	bool lut_diff;
 	u16 lut_size;
+	u8 lut_bits;
 	u32 cfg_val, word;
 
 	/* If there's no gamma lut there's nothing to do here. */
@@ -92,9 +94,11 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 
 	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
+		lut_bits = gamma->data->lut_bits;
 		lut_size = gamma->data->lut_size;
 	} else {
 		lut_diff = false;
+		lut_bits = LUT_BITS_DEFAULT;
 		lut_size = LUT_SIZE_DEFAULT;
 	}
 
@@ -104,9 +108,9 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	for (i = 0; i < lut_size; i++) {
 		struct drm_color_lut diff, hwlut;
 
-		hwlut.red = drm_color_lut_extract(lut[i].red, LUT_BITS_DEFAULT);
-		hwlut.green = drm_color_lut_extract(lut[i].green, LUT_BITS_DEFAULT);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, LUT_BITS_DEFAULT);
+		hwlut.red = drm_color_lut_extract(lut[i].red, lut_bits);
+		hwlut.green = drm_color_lut_extract(lut[i].green, lut_bits);
+		hwlut.blue = drm_color_lut_extract(lut[i].blue, lut_bits);
 
 		if (!lut_diff || (i % 2 == 0)) {
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
@@ -114,13 +118,13 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
 		} else {
 			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, LUT_BITS_DEFAULT);
+			diff.red = drm_color_lut_extract(diff.red, lut_bits);
 
 			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, LUT_BITS_DEFAULT);
+			diff.green = drm_color_lut_extract(diff.green, lut_bits);
 
 			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, LUT_BITS_DEFAULT);
+			diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
 
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
@@ -237,10 +241,12 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_bits = 10,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
+	.lut_bits = 10,
 	.lut_diff = true,
 	.lut_size = 512,
 };
-- 
2.40.1


