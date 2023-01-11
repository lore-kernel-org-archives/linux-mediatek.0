Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8BDC5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rccj3hC3ZZZsXgr2FSQRe2w9nA2OqCkV+QSW2NwXvGo=; b=VDwdXnAWCmU9dwhREysP15cErA
	N08tNDZ76T7bLqyInkjVl1Tye32vgn+bU+ZMZYKCfCTonLfK9pt2hm7uCRqPpWCz1Af751wSm64iM
	m93BmTSAsTyCPM3INvH/a1O8IDNbIDtuJRswFn5mr0DCH9nxEbuOIlimyYrBzPmmD8InQe5GLhOPE
	5SS7WWd7jl0O88LzkbThINZSM+Qyk963uTfigCgiMzJNJm1NyRz24QT+hwEvSqowkCDi9THbq0KiQ
	bt2Lp5ChFV0PqvqlBPwGGLZfWhRipxhF9qVoOm1mGmv7GxWyT+TsNuziaigswb3cfAFfVGH0HUBzK
	HRuhxsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVoh-00A6tG-HY; Wed, 11 Jan 2023 07:46:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVoH-00A6es-UM; Wed, 11 Jan 2023 07:46:12 +0000
X-UUID: 00b8cf5e918411eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Rccj3hC3ZZZsXgr2FSQRe2w9nA2OqCkV+QSW2NwXvGo=;
	b=czHkMuKIduxm0klGkfnMkFtC0eLrhc0Na6FhRzsNq7gfh/qTc6x5NNTiVO1o/S4IF5z2aXj7KffT+EQo0GPeGRx+Xc7fn0v9Q7974fhPjHCAsScFNogNTMHEtFnlXnKl/Mlum73yiy+H89CEpCLEvFmfBgM/ryDK/StaGJlEg2Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:4899d335-2553-4837-99c7-35c42f84d7b1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:bf797df5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 00b8cf5e918411eda08d4d6090ec5a5c-20230111
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 587447732; Wed, 11 Jan 2023 00:46:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 15:45:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 15:45:31 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 12/14] soc: mediatek: mtk-svs: use svs get efuse common function
Date: Wed, 11 Jan 2023 15:45:26 +0800
Message-ID: <20230111074528.29354-13-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111074528.29354-1-roger.lu@mediatek.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_234610_003436_6086B6BB 
X-CRM114-Status: GOOD (  14.68  )
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
index bd23d1111d7b..a7f0a6f02d52 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1758,26 +1758,28 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
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
@@ -1825,7 +1827,8 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	ret = svs_thermal_efuse_get_data(svsp);
+	ret = svs_get_efuse_data(svsp, "t-calibration-data",
+				 &svsp->tefuse, &svsp->tefuse_max);
 	if (ret)
 		return false;
 
@@ -1930,7 +1933,8 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 		}
 	}
 
-	ret = svs_thermal_efuse_get_data(svsp);
+	ret = svs_get_efuse_data(svsp, "t-calibration-data",
+				 &svsp->tefuse, &svsp->tefuse_max);
 	if (ret)
 		return false;
 
@@ -2039,32 +2043,6 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
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
@@ -2404,8 +2382,9 @@ static int svs_probe(struct platform_device *pdev)
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
@@ -2413,13 +2392,13 @@ static int svs_probe(struct platform_device *pdev)
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
@@ -2427,12 +2406,12 @@ static int svs_probe(struct platform_device *pdev)
 		dev_err(svsp->dev, "failed to get clock: %ld\n",
 			PTR_ERR(svsp->main_clk));
 		ret = PTR_ERR(svsp->main_clk);
-		goto svs_probe_free_resource;
+		goto svs_probe_free_tefuse;
 	}
 
 	ret = svs_clk_enable(svsp);
 	if (ret)
-		goto svs_probe_free_resource;
+		goto svs_probe_free_tefuse;
 
 	svsp->base = of_iomap(svsp->dev->of_node, 0);
 	if (IS_ERR_OR_NULL(svsp->base)) {
@@ -2477,7 +2456,7 @@ static int svs_probe(struct platform_device *pdev)
 svs_probe_clk_disable:
 	svs_clk_disable(svsp);
 
-svs_probe_free_resource:
+svs_probe_free_tefuse:
 	if (!IS_ERR_OR_NULL(svsp->tefuse))
 		kfree(svsp->tefuse);
 
-- 
2.18.0


