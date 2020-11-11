Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909E1C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 09:00:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C1820678
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 09:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xcmSRNBL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UGgIg3L4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6C1820678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fqt/GG8dYQr4Z0392lD9AHJ6GqlEVDyWlfbZHohvSr8=; b=xcmSRNBL1KvlTzOsZoszSxwJN
	jy1YtuEwC4Lp14X7fAEa7k/3tz45hlfvUr+OAmiXUoZU9Q0cU86KFNuah00USSwjwfmT2gXMIfoTb
	ih90I5KYtzXbgDyMTGoVbe6y/XNljRo4NWPDA4sBnSQAXfWLAtitu7+YqMhwHSQQucH5rJXD36WIQ
	wbvwcXtGkTD0tSXxpWgGRgLbXt+Zra18i/ag4lbXPy94ciX5+a+4HjMXntIMx4qDADHF0nrwBW7D1
	oIhQQ1LK/BeI4v/FZW0539gDzMbf5U4VRKjNPNPE7JvhAb2EW82l1L9WcYA+txikpLMqrbLecCRz1
	z+EuvGvbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclys-0002wW-5G; Wed, 11 Nov 2020 08:59:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclyo-0002v0-50; Wed, 11 Nov 2020 08:59:51 +0000
X-UUID: 24404859509b4b6591466a941377b2d1-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Kk8vq5BpgbOsN5tAm+oyedVVHGgv6TpX2dDO0j+vQbE=; 
 b=UGgIg3L4FJd4EfWqDM4zIVAZhu1H5P0owG5BfQklwBI967LU1t8NBxLOA95WmYTdpohz/+NBwDG/y5gJvlEd1v82bqvrpokZtcCOljMNM4CT6msq3rRG1Jk93mNfvMUxs9oB/pcua6OkDQFNdD3+5+daIxSEQ5fOxVXTTJlU3sk=;
X-UUID: 24404859509b4b6591466a941377b2d1-20201111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bayi.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1473982752; Wed, 11 Nov 2020 00:59:41 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 00:55:09 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 16:55:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 16:55:07 +0800
From: Bayi Cheng <bayi.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v1] spi: spi-mtk-nor: add axi clock control for MT8192 spi-nor
Date: Wed, 11 Nov 2020 16:55:02 +0800
Message-ID: <1605084902-13151-2-git-send-email-bayi.cheng@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1605084902-13151-1-git-send-email-bayi.cheng@mediatek.com>
References: <1605084902-13151-1-git-send-email-bayi.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_035950_390120_D703E46C 
X-CRM114-Status: GOOD (  16.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 bayi cheng <bayi.cheng@mediatek.com>, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: bayi cheng <bayi.cheng@mediatek.com>

MT8192 spi-nor is an independent sub system, we need extra control axi
bus clock for it. Add support for the additional axi clock to allow it
to be configured appropriately.

Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
---
 drivers/spi/spi-mtk-nor.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index b97f26a..bf2d0f9 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -103,6 +103,7 @@ struct mtk_nor {
 	dma_addr_t buffer_dma;
 	struct clk *spi_clk;
 	struct clk *ctlr_clk;
+	struct clk *axi_clk;
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
@@ -672,6 +673,7 @@ static void mtk_nor_disable_clk(struct mtk_nor *sp)
 {
 	clk_disable_unprepare(sp->spi_clk);
 	clk_disable_unprepare(sp->ctlr_clk);
+	clk_disable_unprepare(sp->axi_clk);
 }
 
 static int mtk_nor_enable_clk(struct mtk_nor *sp)
@@ -688,6 +690,13 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(sp->axi_clk);
+	if (ret) {
+		clk_disable_unprepare(sp->spi_clk);
+		clk_disable_unprepare(sp->ctlr_clk);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -746,7 +755,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	struct spi_controller *ctlr;
 	struct mtk_nor *sp;
 	void __iomem *base;
-	struct clk *spi_clk, *ctlr_clk;
+	struct clk *spi_clk, *ctlr_clk, *axi_clk;
 	int ret, irq;
 	unsigned long dma_bits;
 
@@ -762,6 +771,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(ctlr_clk))
 		return PTR_ERR(ctlr_clk);
 
+	axi_clk = devm_clk_get_optional(&pdev->dev, "axi");
+	if (IS_ERR(axi_clk))
+		return PTR_ERR(axi_clk);
+
 	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
 	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
 		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
@@ -794,6 +807,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->dev = &pdev->dev;
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
+	sp->axi_clk = axi_clk;
 	sp->high_dma = (dma_bits > 32);
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
 				MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
