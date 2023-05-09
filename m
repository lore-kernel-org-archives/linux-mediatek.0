Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4090C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 02:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QJn6CcatIgKelv2sN/+MfAU7roUJAp0T6mjj6hrbnEU=; b=vO2IRo2E186/aoHu868IAR5QSU
	Ujih5OV8r7xQAM8RqRTipLfdiGfC8LZo6Wfyc18pPoZ/PSbVBQ3mlcGwPafeDvE1duMVKOby/f46a
	qlG5AYJcR6aRkXRDhJ7hvgEHaLY1TPgufKu8igIyRtEDWtXQlr0NOsVapnfLqQOvQ8BtEPLNsrDoj
	lZWQ+rfzN//Iy/0VyAjVVJC29lSjAy94ARJXpQBC7Kv3Ez5vaDj9FcX6ewPnkN1r0eg9kvgnwRMRn
	0Y9On2YXSxqtea2tlu/S/2YaB+rq1WLmuPecfKX1A2ekFvs9smimCu6HszAfNjQRh7Vwj3g9nrHFz
	ckjuq4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwCqO-00253N-0C;
	Tue, 09 May 2023 02:12:48 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwCqL-00250d-1V;
	Tue, 09 May 2023 02:12:47 +0000
X-UUID: 664dc89cd2b247b58cbe342628b969e4-20230509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e00b98a3-2ddc-4ba9-90f4-e29fc37af68b,IP:5,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.1.22,REQID:e00b98a3-2ddc-4ba9-90f4-e29fc37af68b,IP:5,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:120426c,CLOUDID:6ace2c6b-2f20-4998-991c-3b78627e4938,B
	ulkID:2305091012243TVTBB2R,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 664dc89cd2b247b58cbe342628b969e4-20230509
X-User: gehao@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
	(envelope-from <gehao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1014334548; Tue, 09 May 2023 10:12:21 +0800
From: Hao Ge <gehao@kylinos.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org
Cc: gehao618@163.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hao Ge <gehao@kylinos.cn>
Subject: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to avoid resource leak in clk_mt8173_apmixed_probe
Date: Tue,  9 May 2023 10:12:14 +0800
Message-Id: <20230509021214.17105-1-gehao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_191245_836391_B6A444FA 
X-CRM114-Status: GOOD (  10.67  )
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

Use devm_platform_ioremap_resource to take the place of of_iomap for
avoid that we don't called iounmap when return some error or remove
device.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Signed-off-by: Hao Ge <gehao@kylinos.cn>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index 8c2aa8b0f39e..8a2a88c63d15 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -146,8 +146,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int r;
 
-	base = of_iomap(node, 0);
-	if (!base)
+	base = devm_of_iomap(&pdev->dev, node, 0, NULL);
+	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

