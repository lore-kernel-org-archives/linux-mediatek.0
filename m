Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA8AC00144
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v331mV8kZ+sM+9Z8ey0fjKYh1v87Ytanvc+CDLeMpcg=; b=3cO3LDt5Ou3nYBHafiKcGgwRhf
	SN1dDx0Y8ZmPLJvvQX5GeosYSZ5cWiKP+8liS6AA8iTMzEN2uDnUCjXBhwpH3Ji62M7KZgUsWYi7+
	u7FkNFCZ2wPCDDHvcovCYLQ0qHEPysxZWxtmW/kXOmt0VEqU0s3NyzxwVVb8xzc1T+j5F6nORcLMz
	jJwBCpSSKWiZn+0c6+DsF599oY6ZED4GuyMpdLAC8BSEnRvn/wWJUb9tdrrI2VPQgsm9iSXvJHK+9
	JZ/KNnGlaUakeZfF13qzdCR49/7BOvjFPl+1SqcJlLN+ZxIv+xYlWKz3jtFsUTR+Ez2sRxUda+Ar2
	BlCr+6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLOm-00088N-7F; Tue, 26 Jul 2022 14:19:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLNR-0007So-JJ; Tue, 26 Jul 2022 14:17:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 91F176601B20;
	Tue, 26 Jul 2022 15:17:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658845054;
	bh=uS7ApYx3lrjLcYD1pymwlYBH9OgH7HrM1kmYQvF3hBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZMfUN1hXPskmNmlXdbD1RV0XzqReyhXu4T8/VylUnoj4BRoTKBfCVCcuu814cdJe
	 3taTMm78ZC8aC88P51C0QRsiHVfRJ2dB65UECGqGX08QsXr3EvSu1Y0CCRqRQDqvKm
	 MLAYLTE8EcMGLpCvBpvdW3T6Sdvs4185uDqOi0Qn/qyimHNVkeo4sC9vD47nIBw3bu
	 NsjvmbqMYXSHgpHkTRX09s90ttSzXGB50gPCY5wB89WBOUwNh31+ta4+kExxHehAO4
	 Ve6HF8p0qPJWNej7K2ciOs5n3aHk6BZtU+CRzkYhCVV/MkovVa9OFautwaQ0DVPvr1
	 +ODsVn63ZtMLw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: roger.lu@mediatek.com,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nfraprado@collabora.com,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/6] soc: mediatek: mtk-svs: Commonize t-calibration-data fuse array read
Date: Tue, 26 Jul 2022 16:16:48 +0200
Message-Id: <20220726141653.177948-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_071737_915072_16EDBB9A 
X-CRM114-Status: GOOD (  13.57  )
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

Commonize the repeating pattern for reading the "t-calibration-data"
efuse data in a new function svs_thermal_efuse_get_data(), reducing
the size of this driver.

No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 111 +++++++++++----------------------
 1 file changed, 38 insertions(+), 73 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 5ac431a04548..600492dc334c 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1684,11 +1684,36 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 	return 0;
 }
 
+static int svs_thermal_efuse_get_data(struct svs_platform *svsp)
+{
+	struct nvmem_cell *cell;
+
+	/* Thermal efuse parsing */
+	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
+	if (IS_ERR_OR_NULL(cell)) {
+		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n", PTR_ERR(cell));
+		return PTR_ERR(cell);
+	}
+
+	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
+	if (IS_ERR(svsp->tefuse)) {
+		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
+			PTR_ERR(svsp->tefuse));
+		nvmem_cell_put(cell);
+		return PTR_ERR(svsp->tefuse);
+	}
+
+	svsp->tefuse_max /= sizeof(u32);
+	nvmem_cell_put(cell);
+
+	return 0;
+}
+
 static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
-	struct nvmem_cell *cell;
 	u32 idx, i, ft_pgm, vmin, golden_temp;
+	int ret;
 
 	for (i = 0; i < svsp->efuse_max; i++)
 		if (svsp->efuse[i])
@@ -1730,24 +1755,9 @@ static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	/* Thermal efuse parsing */
-	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
-	if (IS_ERR_OR_NULL(cell)) {
-		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
-			PTR_ERR(cell));
-		return false;
-	}
-
-	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
-	if (IS_ERR(svsp->tefuse)) {
-		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
-			PTR_ERR(svsp->tefuse));
-		nvmem_cell_put(cell);
+	ret = svs_thermal_efuse_get_data(svsp);
+	if (ret)
 		return false;
-	}
-
-	svsp->tefuse_max /= sizeof(u32);
-	nvmem_cell_put(cell);
 
 	for (i = 0; i < svsp->tefuse_max; i++)
 		if (svsp->tefuse[i] != 0)
@@ -1770,8 +1780,8 @@ static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
 static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
-	struct nvmem_cell *cell;
 	u32 idx, i, vmin, golden_temp;
+	int ret;
 
 	for (i = 0; i < svsp->efuse_max; i++)
 		if (svsp->efuse[i])
@@ -1809,24 +1819,9 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	/* Thermal efuse parsing */
-	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
-	if (IS_ERR_OR_NULL(cell)) {
-		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
-			PTR_ERR(cell));
-		return false;
-	}
-
-	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
-	if (IS_ERR(svsp->tefuse)) {
-		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
-			PTR_ERR(svsp->tefuse));
-		nvmem_cell_put(cell);
+	ret = svs_thermal_efuse_get_data(svsp);
+	if (ret)
 		return false;
-	}
-
-	svsp->tefuse_max /= sizeof(u32);
-	nvmem_cell_put(cell);
 
 	for (i = 0; i < svsp->tefuse_max; i++)
 		if (svsp->tefuse[i] != 0)
@@ -1849,8 +1844,8 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
-	struct nvmem_cell *cell;
 	u32 idx, i, golden_temp;
+	int ret;
 
 	for (i = 0; i < svsp->efuse_max; i++)
 		if (svsp->efuse[i])
@@ -1911,24 +1906,9 @@ static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	/* Thermal efuse parsing */
-	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
-	if (IS_ERR_OR_NULL(cell)) {
-		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
-			PTR_ERR(cell));
+	ret = svs_thermal_efuse_get_data(svsp);
+	if (ret)
 		return false;
-	}
-
-	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
-	if (IS_ERR(svsp->tefuse)) {
-		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
-			PTR_ERR(svsp->tefuse));
-		nvmem_cell_put(cell);
-		return false;
-	}
-
-	svsp->tefuse_max /= sizeof(u32);
-	nvmem_cell_put(cell);
 
 	golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
 	if (!golden_temp)
@@ -1946,11 +1926,11 @@ static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
 static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
-	struct nvmem_cell *cell;
 	int format[6], x_roomt[6], o_vtsmcu[5], o_vtsabb, tb_roomt = 0;
 	int adc_ge_t, adc_oe_t, ge, oe, gain, degc_cali, adc_cali_en_t;
 	int o_slope, o_slope_sign, ts_id;
 	u32 idx, i, ft_pgm, mts, temp0, temp1, temp2;
+	int ret;
 
 	for (i = 0; i < svsp->efuse_max; i++)
 		if (svsp->efuse[i])
@@ -2026,24 +2006,9 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 		}
 	}
 
-	/* Get thermal efuse by nvmem */
-	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
-	if (IS_ERR(cell)) {
-		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
-			PTR_ERR(cell));
-		goto remove_mt8183_svsb_mon_mode;
-	}
-
-	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
-	if (IS_ERR(svsp->tefuse)) {
-		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
-			PTR_ERR(svsp->tefuse));
-		nvmem_cell_put(cell);
-		goto remove_mt8183_svsb_mon_mode;
-	}
-
-	svsp->tefuse_max /= sizeof(u32);
-	nvmem_cell_put(cell);
+	ret = svs_thermal_efuse_get_data(svsp);
+	if (ret)
+		return false;
 
 	/* Thermal efuse parsing */
 	adc_ge_t = (svsp->tefuse[1] >> 22) & GENMASK(9, 0);
-- 
2.35.1


