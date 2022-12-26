Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7B8C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRIPLnz3sU+O7fa5cTPEYIkA+5QeBpoeurMOnstPztM=; b=Bcq/Y3HZ+/e7OD0fF+/oJBtySO
	2X88eRRcTIJrVEww0wF25sSQy8eIHaYJYOhBIvKMz7DRF3Lz5QzsjB2x83nNH+yW6bm9BLGLTaU1D
	4WHlzdvxnO6rn0ZEoLkuXG+wVLLHrB9LVT2q/jGffTxJmHokWA7Q6VD3P32iRbkPTIOOaBFYN1YQN
	jdzTmbk2cq4uSv42ATYxj38/pg/5oNpeuI754Ep9+phktxItkNI6SSMpZ6QZHvhuM4bLCJGFmLCV6
	BBKdyPAE6sb5l6CHjlOE/8RjXJ45NXF93jLyMJijJ1zNeYuFq8MblsppHQxBo1CfYaJEt0m/cCOtF
	S7Kzvy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k3H-002vlU-N6; Mon, 26 Dec 2022 09:45:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k17-002uKA-E2; Mon, 26 Dec 2022 09:43:37 +0000
X-UUID: 4ec236d551f0406f85e6080a4c2e6494-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CRIPLnz3sU+O7fa5cTPEYIkA+5QeBpoeurMOnstPztM=;
	b=Co9JHDIeF7mvVkZ1yaybg1jn7VNY/hD2Pg54XKoOQZhRjpbmUWlxSjInyivuex3BX0PnX3h/0SSTbzdxVqgqM1k0qJ3V5Wc8xVCId7ceWMQCQmw57uCMjgcsPGXu90rydMBKuSqehft/rorrka8lvDgWTCFdtEsmj2pXND+tAsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:fc788344-c2fe-4894-9e6d-efa56b3b45dd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:f91a6a8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4ec236d551f0406f85e6080a4c2e6494-20221226
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1992226160; Mon, 26 Dec 2022 02:43:26 -0700
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
Subject: [PATCH v1 05/13] soc: mediatek: mtk-svs: delete superfluous platform data entries
Date: Mon, 26 Dec 2022 17:42:40 +0800
Message-ID: <20221226094248.4506-6-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221226094248.4506-1-roger.lu@mediatek.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_014333_654029_02AA575E 
X-CRM114-Status: GOOD (  13.46  )
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
index 24d2d07d2d3d..5c9ca373e646 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -311,14 +311,12 @@ static const u32 svs_regs_v2[] = {
 
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
@@ -327,14 +325,12 @@ static const u32 svs_regs_v2[] = {
  * @tefuse: thermal efuse data received from NVMEM framework
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
@@ -2009,7 +2005,7 @@ static bool svs_is_efuse_data_correct(struct svs_platform *svsp)
 	svsp->efuse_max /= sizeof(u32);
 	nvmem_cell_put(cell);
 
-	return svsp->efuse_parsing(svsp);
+	return true;
 }
 
 static struct device *svs_get_subsys_device(struct svs_platform *svsp,
@@ -2338,9 +2334,7 @@ static int svs_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	svsp->dev = &pdev->dev;
-	svsp->name = svsp_data->name;
 	svsp->banks = svsp_data->banks;
-	svsp->efuse_parsing = svsp_data->efuse_parsing;
 	svsp->regs = svsp_data->regs;
 	svsp->bank_max = svsp_data->bank_max;
 
@@ -2351,6 +2345,12 @@ static int svs_probe(struct platform_device *pdev)
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
 
@@ -2388,7 +2388,7 @@ static int svs_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
-					IRQF_ONESHOT, svsp->name, svsp);
+					IRQF_ONESHOT, svsp_data->name, svsp);
 	if (ret) {
 		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
 			svsp_irq, ret);
@@ -2416,11 +2416,13 @@ static int svs_probe(struct platform_device *pdev)
 	clk_disable_unprepare(svsp->main_clk);
 
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


