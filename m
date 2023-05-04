Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0950FC77B78
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 03:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Fgkrac+O7uWikG3dWsfwKk2hO0zPYpGyMjmFVro5ck=; b=pPHO4lCP4/EDEDtX5qe1tu56oU
	4q7kB1VbFM6cc1Cmd7H4UjUr/P0ocC2jWHslPJsKLNz8WoDTYi0Kb67/sPA9kwF2gDzgBsVJD9YTW
	E1SXuumVEcOI3vcPtSzn6WIiLwgJY9kfIc7wwg2qNp4rONr1XMGKeEnQuouCPgg1F9PmxPKr9GhEe
	pVIL2b4WKS5enj5AXy7VwMxZrmoDOcugbTjqwJwSK4tLjdX5wy/j1sKMvUcSwLaoVY+zgVLSUuL0H
	g3lfb1I8iwtgqUaUDPPjFMqEnGwVyrkr+JdwTKxr6pbs06/mAJyKpyVKfdxfhSV0VQN2iwffp/ivS
	DW0FNSvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puPRI-006SBh-26;
	Thu, 04 May 2023 03:15:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puPRG-006SB8-0i;
	Thu, 04 May 2023 03:15:27 +0000
X-UUID: e5ce594eea2911ed912e1518a6540028-20230503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7Fgkrac+O7uWikG3dWsfwKk2hO0zPYpGyMjmFVro5ck=;
	b=odNNdydVt8lS/aqwCwEyM4DmTuIY1zqwd8aynEK2QmdbaSyLFoeaSf/wsHh+hRutn74rqClMNI+mz5j7rv7PRKiS+PdepM6GNkBu7BRU1w7mg5+mUoOVJI1QjWvh7pgrWggMeYSMWJAAeH5eWTP4BXrc6uP99k0Nt1Guq9MUmP4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:d1e58850-c290-4253-9b46-72ccd5b1935a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:697ab71,CLOUDID:6523bbbf-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: e5ce594eea2911ed912e1518a6540028-20230503
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1736565597; Wed, 03 May 2023 20:15:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 May 2023 11:15:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 4 May 2023 11:15:16 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Johnson Wang
	<johnson.wang@mediatek.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Subject: [PATCH v2] PM / devfreq: mtk-cci: refactor error handling of probe and remove
Date: Thu, 4 May 2023 11:15:14 +0800
Message-ID: <20230504031514.19332-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_201526_263658_4EC1FACD 
X-CRM114-Status: GOOD (  14.09  )
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

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

To refactor the regulator/clk handlers so it can follow the way of "Free
the Last Thing Style".

Changes since v2:
- Remove clk_prepare_enable call on parent clock.
- link to v1: Message ID: 20230503092742.19404-1-jia-wei.chang@mediatek.com

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Fixes: b615b00c42da ("PM / devfreq: mediatek: Introduce MediaTek CCI devfreq driver")
---
 drivers/devfreq/mtk-cci-devfreq.c | 39 ++++++++++++++++---------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index e5458ada5197..c3fe2f52f04b 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -294,14 +294,14 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 	if (IS_ERR(drv->sram_reg)) {
 		ret = PTR_ERR(drv->sram_reg);
 		if (ret == -EPROBE_DEFER)
-			goto out_free_resources;
+			goto out_disable_proc_reg;
 
 		drv->sram_reg = NULL;
 	} else {
 		ret = regulator_enable(drv->sram_reg);
 		if (ret) {
 			dev_err(dev, "failed to enable sram regulator\n");
-			goto out_free_resources;
+			goto out_disable_proc_reg;
 		}
 	}
 
@@ -316,12 +316,12 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(drv->cci_clk);
 	if (ret)
-		goto out_free_resources;
+		goto out_disable_sram_reg;
 
 	ret = dev_pm_opp_of_add_table(dev);
 	if (ret) {
 		dev_err(dev, "failed to add opp table: %d\n", ret);
-		goto out_disable_cci_clk;
+		goto out_disable_cci_clock;
 	}
 
 	rate = clk_get_rate(drv->inter_clk);
@@ -329,7 +329,7 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 	if (IS_ERR(opp)) {
 		ret = PTR_ERR(opp);
 		dev_err(dev, "failed to get intermediate opp: %d\n", ret);
-		goto out_remove_opp_table;
+		goto out_free_opp_table;
 	}
 	drv->inter_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
@@ -339,7 +339,7 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 	if (IS_ERR(opp)) {
 		dev_err(dev, "failed to get opp\n");
 		ret = PTR_ERR(opp);
-		goto out_remove_opp_table;
+		goto out_free_opp_table;
 	}
 
 	opp_volt = dev_pm_opp_get_voltage(opp);
@@ -348,13 +348,13 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "failed to scale to highest voltage %lu in proc_reg\n",
 			opp_volt);
-		goto out_remove_opp_table;
+		goto out_free_opp_table;
 	}
 
 	passive_data = devm_kzalloc(dev, sizeof(*passive_data), GFP_KERNEL);
 	if (!passive_data) {
 		ret = -ENOMEM;
-		goto out_remove_opp_table;
+		goto out_free_opp_table;
 	}
 
 	passive_data->parent_type = CPUFREQ_PARENT_DEV;
@@ -365,29 +365,30 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 		ret = -EPROBE_DEFER;
 		dev_err(dev, "failed to add devfreq device: %ld\n",
 			PTR_ERR(drv->devfreq));
-		goto out_remove_opp_table;
+		goto out_free_opp_table;
 	}
 
 	drv->opp_nb.notifier_call = mtk_ccifreq_opp_notifier;
 	ret = dev_pm_opp_register_notifier(dev, &drv->opp_nb);
 	if (ret) {
 		dev_err(dev, "failed to register opp notifier: %d\n", ret);
-		goto out_remove_opp_table;
+		goto out_free_opp_table;
 	}
 	return 0;
 
-out_remove_opp_table:
+out_free_opp_table:
 	dev_pm_opp_of_remove_table(dev);
 
-out_disable_cci_clk:
+out_disable_cci_clock:
 	clk_disable_unprepare(drv->cci_clk);
 
-out_free_resources:
-	if (regulator_is_enabled(drv->proc_reg))
-		regulator_disable(drv->proc_reg);
-	if (drv->sram_reg && regulator_is_enabled(drv->sram_reg))
+out_disable_sram_reg:
+	if (drv->sram_reg)
 		regulator_disable(drv->sram_reg);
 
+out_disable_proc_reg:
+	regulator_disable(drv->proc_reg);
+
 	return ret;
 }
 
@@ -398,12 +399,12 @@ static int mtk_ccifreq_remove(struct platform_device *pdev)
 
 	drv = platform_get_drvdata(pdev);
 
-	dev_pm_opp_unregister_notifier(dev, &drv->opp_nb);
-	dev_pm_opp_of_remove_table(dev);
-	clk_disable_unprepare(drv->cci_clk);
 	regulator_disable(drv->proc_reg);
 	if (drv->sram_reg)
 		regulator_disable(drv->sram_reg);
+	clk_disable_unprepare(drv->cci_clk);
+	dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_unregister_notifier(dev, &drv->opp_nb);
 
 	return 0;
 }
-- 
2.18.0


