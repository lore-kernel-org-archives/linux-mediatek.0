Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF942C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gNcF7vsUH3TomKrULGmuoGv4uA8ZyTj2XFNqGbNkWo=; b=do6JDkq7MKP7TwKJvcMkvNLgWH
	lRYcLmFlhZD68ux/lKU8XjdGVcT+HFAET0nVaMO1zt1vI3FS26liOlEIl524wuEDuEiLP89dNOGaK
	lyticCx5TJRAEM2J8ogZ+mCWTjEi2FeZB3km4hVOvCSSkVmt0EmIXVLLFemLCpmo7QhNeWPo0VvfD
	HvNm/H/sfDtGmPHAUvwnrgb4Wn+h4NhmwflLHHO/qgbGf5lkrrF48phEbey0KWCEnoeXMh4iT/dhv
	0HCmXCwgr2lWX0iMqpazJhrh7k3YLMLvfOTELFeX9B0l2/GgfDKkQ/XGG8q7aK2ebTF9hSIb8scPx
	blB1q1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjWG-002bSb-My; Tue, 03 Jan 2023 15:48:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfni-0013hv-C6; Tue, 03 Jan 2023 11:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4gNcF7vsUH3TomKrULGmuoGv4uA8ZyTj2XFNqGbNkWo=; b=HNhvR700aoN2TrSL1pyfKHGr8E
	OjVIfcMUx0y8MsHCM/nhyaWxwCPdquLx2bAVWNz5Q42pnZSWvin+zq4sueQpB1P+WgVrvgi2rSbTA
	yeeFMEHAXudKKxhZhm9gXkoDS1TAh1BQ1gtGKIK3GM4lYpzMkyYDOTkFNTVecRTrfmqikZesRbdNj
	LsKiG0XLtKu3XKzIXjtB/8/xPqPbH+iE9UxbYX0sCAei2ve/R1vzn7ae8NvAdz4lfk+OVM91DNFc8
	XlRHhGUgBTo/OlHIwgazXbWBL2bX/HyjX3IZmMmrL2Vbne8kOR4bmh230Dn+jLKrL9fS1zOwKZk4+
	K9fZFIKQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCfnR-000aPj-2u;
	Tue, 03 Jan 2023 11:49:37 +0000
X-UUID: 9c537363d93641b688acfb221463740e-20230103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4gNcF7vsUH3TomKrULGmuoGv4uA8ZyTj2XFNqGbNkWo=;
	b=UCyBMSNLCktALEJjdn1Tg5zzc/hJxnJ1IcL+KpwjWAjSO3BQ5MjCfuc5RBqumGSMrOdqaqWRYZYboXrHC9HKBuSiLhEOiOuq3ZBHzXZ6ogAzeO0wnxIskaWvh0IW8FHR41WnKBj6zPLttWqErqNJRxlOnUF1B7DS7Bshw02nz3E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:d85d23af-6cfb-4501-bdf8-11c1ea666e19,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:09771b1,CLOUDID:c8238153-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 9c537363d93641b688acfb221463740e-20230103
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2128577171; Tue, 03 Jan 2023 04:49:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 Jan 2023 19:29:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 3 Jan 2023 19:29:27 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 05/14] soc: mediatek: mtk-svs: move svs_platform_probe into probe
Date: Tue, 3 Jan 2023 19:29:16 +0800
Message-ID: <20230103112925.16554-6-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230103112925.16554-1-roger.lu@mediatek.com>
References: <20230103112925.16554-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_114934_890220_A52F3E4D 
X-CRM114-Status: GOOD (  12.55  )
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


