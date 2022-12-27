Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0194C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncu7dzvmjAzaCKHKvpc5QfiiB7neOIm6BCctvHMioBc=; b=xZV+ByA6QPz711xnzt0Eh5LeLD
	ovUJ/KSG9Dx/rc+WoJokYCXebeeOdT7v9MnVvkOoL0Ca1rTfia6ynN3qVAF/o71UPuFhd8pO7PsO/
	/ZSemQ+aYLTnAzXRXbzH77E5VXNv0TxHQmSpJDbJT7jTDv549bW4sy+aS5bsGwNVzGMPKkDc6eK/z
	YzGZx6MZVDnj36RUJ2eLYgtWXtzLxtoKykveL6Gg1kUsQjigxVh4DywXNuYmsOrDvjjxui6k/fKmS
	F/F1rze5V16h0+uukBDaGu+GcMfUaFUROl3/aiWuQNq+AwrDYkf5wViVBWVU29adl4Ux42ql0i2DR
	9W2d8X/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8pL-00CkD3-HI; Tue, 27 Dec 2022 12:13:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8nK-00CjIV-Bo; Tue, 27 Dec 2022 12:11:13 +0000
X-UUID: 6e48da6e0c1e400882da207882cdd00c-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ncu7dzvmjAzaCKHKvpc5QfiiB7neOIm6BCctvHMioBc=;
	b=OndYrEFfSC786cjK8eiNsW3Xn5ZTl379eCS2snWG2/2h3R7bDW1auS5arqABx0crFtAnG8EfOwe56qoEtK4upXwaDUFEYDhpUyrwVLXH9GQeeeMuXaa//VNl2Ast/XUBcYGvHgNXBWdNlpAq3maO3M7UEoqAvGrjzOkzlWkJeNQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:cb8b78bc-4ac1-403c-8c10-50b90f59a470,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:ad99898a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6e48da6e0c1e400882da207882cdd00c-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 765538510; Tue, 27 Dec 2022 05:10:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Dec 2022 20:09:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 20:09:18 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 08/13] soc: mediatek: mtk-svs: use svs get efuse common function
Date: Tue, 27 Dec 2022 20:09:09 +0800
Message-ID: <20221227120914.11346-9-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227120914.11346-1-roger.lu@mediatek.com>
References: <20221227120914.11346-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_041058_695678_AEDBF7A5 
X-CRM114-Status: GOOD (  12.52  )
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

SVS might need to read both svs efuse and thermal efuse on the probe flow.
Therefore, add a common efuse read function to remove the superfluous
codes.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 69 ++++++++++++----------------------
 1 file changed, 24 insertions(+), 45 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 9578baf3d9a7..70f87715a084 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1701,26 +1701,28 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 	return 0;
 }
 
-static int svs_thermal_efuse_get_data(struct svs_platform *svsp)
+static int svs_get_efuse_data(struct svs_platform *svsp,
+			      const char *nvmem_cell_name,
+			      u32 **svsp_efuse, size_t *svsp_efuse_max)
 {
 	struct nvmem_cell *cell;
 
-	/* Thermal efuse parsing */
-	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
+	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
 	if (IS_ERR_OR_NULL(cell)) {
-		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n", PTR_ERR(cell));
+		dev_err(svsp->dev, "no \"%s\"? %ld\n",
+			nvmem_cell_name, PTR_ERR(cell));
 		return PTR_ERR(cell);
 	}
 
-	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
-	if (IS_ERR(svsp->tefuse)) {
-		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
-			PTR_ERR(svsp->tefuse));
+	*svsp_efuse = nvmem_cell_read(cell, svsp_efuse_max);
+	if (IS_ERR(*svsp_efuse)) {
+		dev_err(svsp->dev, "cannot read \"%s\" efuse: %ld\n",
+			nvmem_cell_name, PTR_ERR(*svsp_efuse));
 		nvmem_cell_put(cell);
-		return PTR_ERR(svsp->tefuse);
+		return PTR_ERR(*svsp_efuse);
 	}
 
-	svsp->tefuse_max /= sizeof(u32);
+	*svsp_efuse_max /= sizeof(u32);
 	nvmem_cell_put(cell);
 
 	return 0;
@@ -1768,7 +1770,8 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	ret = svs_thermal_efuse_get_data(svsp);
+	ret = svs_get_efuse_data(svsp, "t-calibration-data",
+				 &svsp->tefuse, &svsp->tefuse_max);
 	if (ret)
 		return false;
 
@@ -1873,7 +1876,8 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 		}
 	}
 
-	ret = svs_thermal_efuse_get_data(svsp);
+	ret = svs_get_efuse_data(svsp, "t-calibration-data",
+				 &svsp->tefuse, &svsp->tefuse_max);
 	if (ret)
 		return false;
 
@@ -1975,32 +1979,6 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 	return true;
 }
 
-static bool svs_is_efuse_data_correct(struct svs_platform *svsp)
-{
-	struct nvmem_cell *cell;
-
-	/* Get svs efuse by nvmem */
-	cell = nvmem_cell_get(svsp->dev, "svs-calibration-data");
-	if (IS_ERR(cell)) {
-		dev_err(svsp->dev, "no \"svs-calibration-data\"? %ld\n",
-			PTR_ERR(cell));
-		return false;
-	}
-
-	svsp->efuse = nvmem_cell_read(cell, &svsp->efuse_max);
-	if (IS_ERR(svsp->efuse)) {
-		dev_err(svsp->dev, "cannot read svs efuse: %ld\n",
-			PTR_ERR(svsp->efuse));
-		nvmem_cell_put(cell);
-		return false;
-	}
-
-	svsp->efuse_max /= sizeof(u32);
-	nvmem_cell_put(cell);
-
-	return true;
-}
-
 static struct device *svs_get_subsys_device(struct svs_platform *svsp,
 					    const char *node_name)
 {
@@ -2335,8 +2313,9 @@ static int svs_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (!svs_is_efuse_data_correct(svsp)) {
-		dev_notice(svsp->dev, "efuse data isn't correct\n");
+	ret = svs_get_efuse_data(svsp, "svs-calibration-data",
+				 &svsp->efuse, &svsp->efuse_max);
+	if (ret) {
 		ret = -EPERM;
 		goto svs_probe_free_efuse;
 	}
@@ -2344,13 +2323,13 @@ static int svs_probe(struct platform_device *pdev)
 	if (!svsp_data->efuse_parsing(svsp)) {
 		dev_err(svsp->dev, "efuse data parsing failed\n");
 		ret = -EPERM;
-		goto svs_probe_free_resource;
+		goto svs_probe_free_tefuse;
 	}
 
 	ret = svs_bank_resource_setup(svsp);
 	if (ret) {
 		dev_err(svsp->dev, "svs bank resource setup fail: %d\n", ret);
-		goto svs_probe_free_resource;
+		goto svs_probe_free_tefuse;
 	}
 
 	svsp->main_clk = devm_clk_get(svsp->dev, "main");
@@ -2358,13 +2337,13 @@ static int svs_probe(struct platform_device *pdev)
 		dev_err(svsp->dev, "failed to get clock: %ld\n",
 			PTR_ERR(svsp->main_clk));
 		ret = PTR_ERR(svsp->main_clk);
-		goto svs_probe_free_resource;
+		goto svs_probe_free_tefuse;
 	}
 
 	ret = clk_prepare_enable(svsp->main_clk);
 	if (ret) {
 		dev_err(svsp->dev, "cannot enable main clk: %d\n", ret);
-		goto svs_probe_free_resource;
+		goto svs_probe_free_tefuse;
 	}
 
 	svsp->base = of_iomap(svsp->dev->of_node, 0);
@@ -2408,7 +2387,7 @@ static int svs_probe(struct platform_device *pdev)
 svs_probe_clk_disable:
 	clk_disable_unprepare(svsp->main_clk);
 
-svs_probe_free_resource:
+svs_probe_free_tefuse:
 	if (!IS_ERR_OR_NULL(svsp->tefuse))
 		kfree(svsp->tefuse);
 
-- 
2.18.0


