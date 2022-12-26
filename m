Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B9DC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXUri6oQlDy/I4dgh4ERnssOE8CRkSi9XYLnEpGTjrY=; b=ibxFot+8WcSnO5JYtTE/CKCMyT
	9b0O/9n8YysEsDGAsVWXNsRixET90nEOePtt7cce022wfhuS0XtwXDTcuSQcYirs9JeEsTVh83m9I
	s4jaI26FHORinYOvbIejucZiaaA58poeE3tQY2qFUVhD/bhBOSm9j9tO504TXmdygBSIBOHtVCXWM
	xhLrr0lLfs9yZKaS2yMhaCTCF5NNunUKa3+M/DEZ2/hKpGPXmAYPL3rri3GwXL3LkD4K1XSDrwdtp
	WL6nsZygqtnXyS7JOYoV1WrquInSAZifD50mlScZi3z5gmjP+fyg6oWhcP9NVRfYaZNe4o1/Osgyr
	QWWLS4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k2L-002v70-Ft; Mon, 26 Dec 2022 09:44:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k15-002uIY-E9; Mon, 26 Dec 2022 09:43:35 +0000
X-UUID: a4f779ab05b4468598fa272bfe951b60-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oXUri6oQlDy/I4dgh4ERnssOE8CRkSi9XYLnEpGTjrY=;
	b=F6vgyQey5hHyw0IunvGI+OuMWXXHcs9jJYYzyvmhgMqoW4OX6cHeli9YozgO5+j47R6C7YH2ft3d/ig2aCKAWSJmiHnMxzbGi5xs7IzR7qi0qndw2PXrtrk0ivsCTnQ+Vv8K+1GXpekLV1nDHEZan3FB6avF927tAZ/1/JRz+nk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:64d34af8-32b7-43ae-86ea-d3ab1ac790e0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:d9bbf8f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a4f779ab05b4468598fa272bfe951b60-20221226
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 485854711; Mon, 26 Dec 2022 02:43:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 26 Dec 2022 17:42:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Dec 2022 17:42:50 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 06/13] soc: mediatek: mtk-svs: use svs get efuse common function
Date: Mon, 26 Dec 2022 17:42:41 +0800
Message-ID: <20221226094248.4506-7-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221226094248.4506-1-roger.lu@mediatek.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_014332_073616_D036378C 
X-CRM114-Status: GOOD (  12.87  )
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
index 5c9ca373e646..477f5bd1e1d1 100644
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
 
@@ -1982,32 +1986,6 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
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
@@ -2342,8 +2320,9 @@ static int svs_probe(struct platform_device *pdev)
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
@@ -2351,13 +2330,13 @@ static int svs_probe(struct platform_device *pdev)
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
@@ -2365,13 +2344,13 @@ static int svs_probe(struct platform_device *pdev)
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
@@ -2415,7 +2394,7 @@ static int svs_probe(struct platform_device *pdev)
 svs_probe_clk_disable:
 	clk_disable_unprepare(svsp->main_clk);
 
-svs_probe_free_resource:
+svs_probe_free_tefuse:
 	if (!IS_ERR_OR_NULL(svsp->tefuse))
 		kfree(svsp->tefuse);
 
-- 
2.18.0


