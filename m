Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0ABC61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIJdT42QVXwbr3edN045kFIxJFSYVuxtTPY35Vt4efg=; b=JrRsWMNe3LTHiZZRoPiCSmlIn6
	32cT5KPEzZQ1mHyH2GHqk5kzWJrKtS7h95iTh1t9pyLncAUQfjgrez1DAKa6wplfMTnruJ3OP/3N8
	CFsPg/ro3xyNf1Ogw5PUfZ9boYpXwb1PHGIWKnuHKVMXMGWKDk6ko1nXPYh9k7/x5VqRdMcGnVwvL
	msM9bLPhEzkeXC6EJEjdm/sn0Yk6DsmuAcwxTOWsIalx+QXZh3KNmQCgQOvI9EXRm0E3yfOGtZNkS
	g69bEo9esljTjn8EBACij7rgLRa24jXfLh+p3XJNNy9ydKrYCZN21aMnDfJwCcRe0bMgDQWMnkPTM
	AQATlgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNQ-00GdVK-12;
	Tue, 21 Nov 2023 11:57:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PMv-00Gd3e-0v;
	Tue, 21 Nov 2023 11:56:44 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F33D6607323;
	Tue, 21 Nov 2023 11:56:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567800;
	bh=n+I9YOPDM99MnwpUCp/Jyp5QiCWQ9S9IzP9LXdnM4XE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AAip3lX8sainuX5kpVdTIrGCqKuS6Q4JEdymjzNCyX6p5R1ldIL5l5QjdevQ7ANDT
	 6fH5FjFcBrylxvPMSwvi2ISCwFQu0Hiedm73yvbd0Cc3krTXSTjyaIbCAEFJvIvv5y
	 8IAdg7aVKFvLlxlwJl+bH7qcRInxOp7Qf8XLNq3rZXLtXsK0b4Apl+m6KgVFtTObbe
	 HICu6OcbM9msMBbTz4EsE8OCItJ1m7+6C+PqRUrsFwuG8mkBkhjIoLDfZfcvvYRIBt
	 SqOo4+YI3/KawA7hNDwDMsp/Lgq4yXlcmoPW4xaAkphx9J3TLPlc2pN00WVX1RH/5S
	 VgqiJAkqfc1/w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 08/20] soc: mediatek: mtk-svs: Add SVS-Thermal coefficient to SoC platform data
Date: Tue, 21 Nov 2023 12:56:12 +0100
Message-ID: <20231121115624.56855-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
References: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035641_468839_547B82F4 
X-CRM114-Status: GOOD (  14.67  )
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

In preparation for commonizing the efuse parsing function, add the
SVS-Thermal coefficients for all SoCs for which said function can be
commonized (MT8186, MT8188, MT8192, MT8195) and assign those to their
platform data structure.
That will be used to calculate the MTS parameter with the equation
                     MTS = (ts_coeff * 2) / 1000

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 6c6f133c327f..ab564d48092b 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -118,6 +118,10 @@
 #define SVSB_VOPS_FLD_VOP2_6		GENMASK(23, 16)
 #define SVSB_VOPS_FLD_VOP3_7		GENMASK(31, 24)
 
+/* SVS Thermal Coefficients */
+#define SVSB_TS_COEFF_MT8195		250460
+#define SVSB_TS_COEFF_MT8186		204650
+
 /* svs bank related setting */
 #define BITS8				8
 #define MAX_OPP_ENTRIES			16
@@ -374,6 +378,7 @@ struct svs_fusemap {
  * @bank_max: total number of svs banks
  * @efuse: svs efuse data received from NVMEM framework
  * @tefuse: thermal efuse data received from NVMEM framework
+ * @ts_coeff: thermal sensors coefficient
  */
 struct svs_platform {
 	void __iomem *base;
@@ -388,6 +393,7 @@ struct svs_platform {
 	u32 bank_max;
 	u32 *efuse;
 	u32 *tefuse;
+	u32 ts_coeff;
 };
 
 struct svs_platform_data {
@@ -398,6 +404,7 @@ struct svs_platform_data {
 	const struct svs_fusemap *glb_fuse_map;
 	const u32 *regs;
 	u32 bank_max;
+	u32 ts_coeff;
 };
 
 /**
@@ -2926,6 +2933,7 @@ static const struct svs_platform_data svs_mt8195_platform_data = {
 	.probe = svs_mt8192_platform_probe,
 	.regs = svs_regs_v2,
 	.bank_max = ARRAY_SIZE(svs_mt8195_banks),
+	.ts_coeff = SVSB_TS_COEFF_MT8195,
 	.glb_fuse_map = (const struct svs_fusemap[GLB_MAX]) {
 		{ 0, 0 }, { 19, 4 }
 	}
@@ -2938,6 +2946,7 @@ static const struct svs_platform_data svs_mt8192_platform_data = {
 	.probe = svs_mt8192_platform_probe,
 	.regs = svs_regs_v2,
 	.bank_max = ARRAY_SIZE(svs_mt8192_banks),
+	.ts_coeff = SVSB_TS_COEFF_MT8195,
 	.glb_fuse_map = (const struct svs_fusemap[GLB_MAX]) {
 		/* FT_PGM not present */
 		{ -1, 0 }, { 19, 4 }
@@ -2951,6 +2960,7 @@ static const struct svs_platform_data svs_mt8188_platform_data = {
 	.probe = svs_mt8192_platform_probe,
 	.regs = svs_regs_v2,
 	.bank_max = ARRAY_SIZE(svs_mt8188_banks),
+	.ts_coeff = SVSB_TS_COEFF_MT8195,
 	.glb_fuse_map = (const struct svs_fusemap[GLB_MAX]) {
 		/* FT_PGM and VMIN not present */
 		{ -1, 0 }, { -1, 0 }
@@ -2964,6 +2974,7 @@ static const struct svs_platform_data svs_mt8186_platform_data = {
 	.probe = svs_mt8186_platform_probe,
 	.regs = svs_regs_v2,
 	.bank_max = ARRAY_SIZE(svs_mt8186_banks),
+	.ts_coeff = SVSB_TS_COEFF_MT8186,
 	.glb_fuse_map = (const struct svs_fusemap[GLB_MAX]) {
 		/* FT_PGM and VMIN not present */
 		{ -1, 0 }, { -1, 0 }
@@ -3021,6 +3032,7 @@ static int svs_probe(struct platform_device *pdev)
 	svsp->banks = svsp_data->banks;
 	svsp->regs = svsp_data->regs;
 	svsp->bank_max = svsp_data->bank_max;
+	svsp->ts_coeff = svsp_data->ts_coeff;
 
 	ret = svsp_data->probe(svsp);
 	if (ret)
-- 
2.42.0


