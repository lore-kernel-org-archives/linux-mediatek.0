Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632B5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gNcF7vsUH3TomKrULGmuoGv4uA8ZyTj2XFNqGbNkWo=; b=PLxpgrAltjjOoAdNTcESxDt3yb
	zXEaqQwKvOhIcP5llNFgrp1MVoAbYyeL5DD3Fmn9urFxw4+T7ghmecRqwMvl1Zu43uyzJIJFiOONZ
	aywOJuX10lP5PC0cmdVoSlKKNTfD1cBlrlaK15Iu6IQs51tg3vzw0g1r2gfQn2KvQxszfsFgdKxMH
	5DFDc+x+glVGLcsQYDJ17B2zfvax38o7DYhxGsgwGGj/RC41vUpH5xDe3HJ0aFpWnFidEJVxWlUpe
	OmC8if5BbhAoSfemWQC7E5ZcjPudZFAZh5EHU+6SNOMUhGUsxZ8yZPn26GTvInZo3rYGA6WPM4Fc2
	aHeGbliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8pG-00CkAH-TN; Tue, 27 Dec 2022 12:12:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8nJ-00CjHE-Rg; Tue, 27 Dec 2022 12:11:10 +0000
X-UUID: 4a60731041864bb98990629f5bb0813b-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4gNcF7vsUH3TomKrULGmuoGv4uA8ZyTj2XFNqGbNkWo=;
	b=MW1lBboZRr8ZsLsulQ4ESBJqbK7rfdhBBxk0d/BQYsGnRTVvFFvZu6M7kBrSFQsXnoLHwN+Ij+I738Javq2ZtskzarJkqHiUpaDUV+A4bxUcVPvodI/d+69sLWaIQNbULe2+urIpgmxM5KoBRNlxqwij+VtzZthNNYVjpsFVWUc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e48e773e-e631-4e00-aaaa-6f819074cf7a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:ab99898a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4a60731041864bb98990629f5bb0813b-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 113212948; Tue, 27 Dec 2022 05:10:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Dec 2022 20:09:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 20:09:17 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 05/13] soc: mediatek: mtk-svs: move svs_platform_probe into probe
Date: Tue, 27 Dec 2022 20:09:06 +0800
Message-ID: <20221227120914.11346-6-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227120914.11346-1-roger.lu@mediatek.com>
References: <20221227120914.11346-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_041057_940297_965A9F9F 
X-CRM114-Status: GOOD (  11.50  )
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

Moving svs_platform_probe into driver probe function will allow us to
reduce svs_platform members. This will be done in a follow-up patch.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 7fea1a5bb842..bbec96696c55 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2325,17 +2325,17 @@ static const struct of_device_id svs_of_match[] = {
 	},
 };
 
-static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
+static int svs_probe(struct platform_device *pdev)
 {
 	struct svs_platform *svsp;
 	const struct svs_platform_data *svsp_data;
-	int ret;
+	int ret, svsp_irq;
 
 	svsp_data = of_device_get_match_data(&pdev->dev);
 
 	svsp = devm_kzalloc(&pdev->dev, sizeof(*svsp), GFP_KERNEL);
 	if (!svsp)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	svsp->dev = &pdev->dev;
 	svsp->name = svsp_data->name;
@@ -2346,19 +2346,7 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 
 	ret = svsp_data->probe(svsp);
 	if (ret)
-		return ERR_PTR(ret);
-
-	return svsp;
-}
-
-static int svs_probe(struct platform_device *pdev)
-{
-	struct svs_platform *svsp;
-	int svsp_irq, ret;
-
-	svsp = svs_platform_probe(pdev);
-	if (IS_ERR(svsp))
-		return PTR_ERR(svsp);
+		return ret;
 
 	if (!svs_is_efuse_data_correct(svsp)) {
 		dev_notice(svsp->dev, "efuse data isn't correct\n");
-- 
2.18.0


