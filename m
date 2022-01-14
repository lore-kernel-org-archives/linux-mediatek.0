Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 06:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8B4fJq1zBjT7lENrFDwa3wQZGnWjUissLn0C3TlgBx8=; b=I0xtznHzC/U09A
	ChJF9+qK6+nVOuNS5tz+TafDWsyJ7pkigQbHlouCBjGEmucA7Xy+XtDmZ1AC/xK1ogv9kGq+C8ak+
	g0QRKF+h56qLI/dtGkH7eT8VIp84iXEgtzHXYQBGAchUlQMwlJ6vpdEfFyqx5ttQSLnQo+n2c9PWG
	FMdghXk414BHIoleVklNqyXSdy/390rKce59rhQkVAjexBvbSkZ7qaOdoG7b+D1tnPvPvfBGH6SVs
	W/xtxWG1oCWST+xBx32UcO4PMeje/j1fBGJSUulaKEIerSHGXnZCSTon8AraPkNweQt+t7OWMNJRf
	gNPrFuXpdFjke24oghOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8G1w-007uHy-RZ; Fri, 14 Jan 2022 06:25:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8G1t-007uFU-MS
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 06:25:43 +0000
X-UUID: 6241643c74ea4ef4938b82980dc24244-20220113
X-UUID: 6241643c74ea4ef4938b82980dc24244-20220113
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 452551414; Thu, 13 Jan 2022 23:24:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 22:24:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 14 Jan 2022 14:24:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 14:24:27 +0800
From: <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, "Guochun
 Mao" <guochun.mao@mediatek.com>
Subject: [PATCH v1 4/4] spi: spi-mtk-nor: add axi_s clock for mt8186
Date: Fri, 14 Jan 2022 14:24:08 +0800
Message-ID: <20220114062408.9077-5-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114062408.9077-1-guochun.mao@mediatek.com>
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_222541_764759_0E683D7B 
X-CRM114-Status: GOOD (  12.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Guochun Mao <guochun.mao@mediatek.com>

MT8186 needs axi_s clock for DMA feature.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
---
 drivers/spi/spi-mtk-nor.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index f8f6e6c1b551..4ccbac674ff7 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -109,6 +109,7 @@ struct mtk_nor {
 	struct clk *spi_clk;
 	struct clk *ctlr_clk;
 	struct clk *axi_clk;
+	struct clk *axi_s_clk;
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
@@ -685,6 +686,7 @@ static void mtk_nor_disable_clk(struct mtk_nor *sp)
 	clk_disable_unprepare(sp->spi_clk);
 	clk_disable_unprepare(sp->ctlr_clk);
 	clk_disable_unprepare(sp->axi_clk);
+	clk_disable_unprepare(sp->axi_s_clk);
 }
 
 static int mtk_nor_enable_clk(struct mtk_nor *sp)
@@ -708,6 +710,14 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(sp->axi_s_clk);
+	if (ret) {
+		clk_disable_unprepare(sp->spi_clk);
+		clk_disable_unprepare(sp->ctlr_clk);
+		clk_disable_unprepare(sp->axi_clk);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -783,7 +793,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	struct mtk_nor *sp;
 	struct mtk_nor_caps *caps;
 	void __iomem *base;
-	struct clk *spi_clk, *ctlr_clk, *axi_clk;
+	struct clk *spi_clk, *ctlr_clk, *axi_clk, *axi_s_clk;
 	int ret, irq;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -802,6 +812,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(axi_clk))
 		return PTR_ERR(axi_clk);
 
+	axi_s_clk = devm_clk_get_optional(&pdev->dev, "axi_s");
+	if (IS_ERR(axi_s_clk))
+		return PTR_ERR(axi_s_clk);
+
 	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev->dev);
 	if (dma_set_mask_and_coherent(&pdev->dev,
 				      DMA_BIT_MASK(caps->dma_bits))) {
@@ -837,6 +851,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
 	sp->axi_clk = axi_clk;
+	sp->axi_s_clk = axi_s_clk;
 	sp->caps = caps;
 	sp->high_dma = caps->dma_bits > 32;
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
