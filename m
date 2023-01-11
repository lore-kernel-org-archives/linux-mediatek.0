Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C75C5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7GE4jlQlN3+ar5Gqg8Y3m16Njg/s9VQt5fSavqYdJ0=; b=vyZvmaMLJPeK7clUqkYm1PGjEY
	RG/rq0aqzoikNK8VwPt8lUM2ZaXGBWo5yAzjqWJoWAL/LCoX2xNj3JASC9wT18FNi4BD/5VUH3Uqf
	jDHqILOOXKCEZz/p34ORBVnm4YPag6jfmpyvY5VSaKcE3Vx7mlDkXVkSHK3LzZHE9TuGaATA9GN0/
	XRcuKvX/VVB8TKovxeeNAdXM96DghkS3xM9oQ906QWyEDTJ1pMcjtWL0Mu1e4JEU3N1oJvBYSuSrj
	aqHYC1MCSQiwG3ZmUgbh/UDIeVAmPVQTfh7a7FG9VGe3VeZwJUvqMxKmFn5tSMgtyrEcBbdHr+Zge
	x1Ny4fKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVpx-00A7iL-At; Wed, 11 Jan 2023 07:47:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVoI-00A6fa-QE; Wed, 11 Jan 2023 07:46:15 +0000
X-UUID: 014e1280918411edbbe3f76fe852e059-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t7GE4jlQlN3+ar5Gqg8Y3m16Njg/s9VQt5fSavqYdJ0=;
	b=rdwdZpIqRtOExTjMA03e8PZZzpKaA2C09YC/ddEuxxzOlo34rc8RmoTwZRpjj4A6byyX16NCfQiZzQXu/Ktoj5ND6Hjtocntb6Z+bVKDOkeIuBE8a3bDR181V7AWnLlLA3zvlMNLNpIVXfBA96oFWaH06feDHwuZFMMqhLPWzbU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:a9745de1-715e-4575-b42c-801d962e1a2b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.17,REQID:a9745de1-715e-4575-b42c-801d962e1a2b,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:543e81c,CLOUDID:137a7df5-ff42-4fb0-b929-626456a83c14,B
	ulkID:2301111545344SMVVLJN,BulkQuantity:4,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0
X-UUID: 014e1280918411edbbe3f76fe852e059-20230111
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 430133919; Wed, 11 Jan 2023 00:46:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 15:45:31 +0800
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
Subject: [PATCH v4 11/14] soc: mediatek: mtk-svs: delete superfluous platform data entries
Date: Wed, 11 Jan 2023 15:45:25 +0800
Message-ID: <20230111074528.29354-12-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111074528.29354-1-roger.lu@mediatek.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_234610_895451_2E90BF05 
X-CRM114-Status: GOOD (  14.85  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

The platform name and efuse parsing function pointer are only used while
probing the device. Use them from the svs_platform_data struct instead.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 9d9210c22289..bd23d1111d7b 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -313,14 +313,12 @@ static const u32 svs_regs_v2[] = {
 
 /**
  * struct svs_platform - svs platform control
- * @name: svs platform name
  * @base: svs platform register base
  * @dev: svs platform device
  * @main_clk: main clock for svs bank
  * @pbank: svs bank pointer needing to be protected by spin_lock section
  * @banks: svs banks that svs platform supports
  * @rst: svs platform reset control
- * @efuse_parsing: svs platform efuse parsing function pointer
  * @efuse_max: total number of svs efuse
  * @tefuse_max: total number of thermal efuse
  * @regs: svs platform registers map
@@ -330,14 +328,12 @@ static const u32 svs_regs_v2[] = {
  * @clk_cnt: clock count shows the clk enable/disable times by svs driver
  */
 struct svs_platform {
-	char *name;
 	void __iomem *base;
 	struct device *dev;
 	struct clk *main_clk;
 	struct svs_bank *pbank;
 	struct svs_bank *banks;
 	struct reset_control *rst;
-	bool (*efuse_parsing)(struct svs_platform *svsp);
 	size_t efuse_max;
 	size_t tefuse_max;
 	const u32 *regs;
@@ -2066,7 +2062,7 @@ static bool svs_is_efuse_data_correct(struct svs_platform *svsp)
 	svsp->efuse_max /= sizeof(u32);
 	nvmem_cell_put(cell);
 
-	return svsp->efuse_parsing(svsp);
+	return true;
 }
 
 static struct device *svs_get_subsys_device(struct svs_platform *svsp,
@@ -2400,9 +2396,7 @@ static int svs_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	svsp->dev = &pdev->dev;
-	svsp->name = svsp_data->name;
 	svsp->banks = svsp_data->banks;
-	svsp->efuse_parsing = svsp_data->efuse_parsing;
 	svsp->regs = svsp_data->regs;
 	svsp->bank_max = svsp_data->bank_max;
 
@@ -2413,6 +2407,12 @@ static int svs_probe(struct platform_device *pdev)
 	if (!svs_is_efuse_data_correct(svsp)) {
 		dev_notice(svsp->dev, "efuse data isn't correct\n");
 		ret = -EPERM;
+		goto svs_probe_free_efuse;
+	}
+
+	if (!svsp_data->efuse_parsing(svsp)) {
+		dev_err(svsp->dev, "efuse data parsing failed\n");
+		ret = -EPERM;
 		goto svs_probe_free_resource;
 	}
 
@@ -2448,7 +2448,7 @@ static int svs_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
-					IRQF_ONESHOT, svsp->name, svsp);
+					IRQF_ONESHOT, svsp_data->name, svsp);
 	if (ret) {
 		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
 			svsp_irq, ret);
@@ -2478,11 +2478,13 @@ static int svs_probe(struct platform_device *pdev)
 	svs_clk_disable(svsp);
 
 svs_probe_free_resource:
-	if (!IS_ERR_OR_NULL(svsp->efuse))
-		kfree(svsp->efuse);
 	if (!IS_ERR_OR_NULL(svsp->tefuse))
 		kfree(svsp->tefuse);
 
+svs_probe_free_efuse:
+	if (!IS_ERR_OR_NULL(svsp->efuse))
+		kfree(svsp->efuse);
+
 	return ret;
 }
 
-- 
2.18.0


