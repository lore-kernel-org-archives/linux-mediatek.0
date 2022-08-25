Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B21AECAA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg8sGO8iry3CEYG8PqF5DRphz5mzK+s5pUO7VfrICQQ=; b=Suf1eCd/K/3PknjY1VAB3KrBvu
	pJos/YOrNTFDoLMJu7q4/O2Q3fpaVpHe/WceOb9dXXO5Rx6gWY4kacp9PHlBwAHN0X9wBI6BF70BN
	GdaR6OObopiNUVC6j6zFn3ubXxjQbAVnL1Lj6rFtVmMgbk54i0uzXe+Hqd2FnOrfPXd4FDcoss1oK
	KqZ7JtCE/S3X3EzcDBjUDn1mupcI1vNxmICkmoF8Hg62JIuWmTfJTimunbH7yeQ/Lz6LC7F/yacUu
	vw+cPqyBw4pMfyepq/gQ3agE5waWVZhMw4w5fmXbcwzgSZR0PwEoMOveNAE58OmHfYyiNCCdTCOkx
	m4an97RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHsr-001eNi-20; Thu, 25 Aug 2022 18:47:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHs8-001aOc-V1; Thu, 25 Aug 2022 18:46:35 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25FA26601EAF;
	Thu, 25 Aug 2022 19:46:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661453182;
	bh=dhmaNfxwX2nOLfTfnDrbNJDJaVQkem8mQ34apy48xhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G1EJ3DJyzYhFMV/7rbjEqEN1w3Jb3fdf3PLkd1oqYO1v1j4rbvmDGlEOyMBpt+73N
	 3GoUze36CODFT67SbHOn2cdchH1h37VaaDFirVkurZgzttEnVpYr6AnpUc81+H164+
	 aCRRENkU1YoJLbdLyUUvW1jxMaPOLAdRgF6t8hJr1j9Msv8r9fMU9qpksD7UjCDqqE
	 aV/FS8E4dulWDz1LwJRaziL6fWRubtypdeJPa6F1VVtlfbIGjdqVMh/zoaO98RHdej
	 T6FkK37KIpiR72011U+aBQJ/+xPxDnaErLJaLubMoYwBJkTXJaklXhHltegfhj0sHU
	 f91JrgoG94ETQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: khilman@baylibre.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	roger.lu@mediatek.com,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] soc: mediatek: mtk-svs: Commonize t-calibration-data fuse array read
Date: Thu, 25 Aug 2022 14:46:15 -0400
Message-Id: <20220825184616.2118870-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825184616.2118870-1-nfraprado@collabora.com>
References: <20220825184616.2118870-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_114633_303373_7E580DFC 
X-CRM114-Status: GOOD (  14.24  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Commonize the repeating pattern for reading the "t-calibration-data"
efuse data in a new function svs_thermal_efuse_get_data(), reducing
the size of this driver.

No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Rebased and dropped mt8195 and mt8186 hunks, as they're not merged yet

 drivers/soc/mediatek/mtk-svs.c | 69 ++++++++++++++++------------------
 1 file changed, 32 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index d96b9d3f3a83..63253e22abdd 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1641,11 +1641,36 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
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
 static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
-	struct nvmem_cell *cell;
 	u32 idx, i, vmin, golden_temp;
+	int ret;
 
 	for (i = 0; i < svsp->efuse_max; i++)
 		if (svsp->efuse[i])
@@ -1683,24 +1708,9 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
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
@@ -1723,11 +1733,11 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
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
@@ -1803,24 +1813,9 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
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
2.37.2


