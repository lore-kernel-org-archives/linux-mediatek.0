Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4195C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 05:54:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 783D861966
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 05:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 783D861966
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RZg3lLuLTW1RbEX+0dMG8SEG5bTKCBMq8FVcEQJPiM8=; b=lp5kjrp5HhKR3/MJTadRV12E8
	cXi57jIpyoqnTleYs+XTLKMp2UpbiUf5OIYtojoFKr24AIWb3IW/hHzPiSd8bgn8r8a7U5pj7R86o
	V1jS6QUVuDJpyMZq2lHUA4H0H69jH7ioXPznoEeTP1bp31ljWNNegbjcx1nB7DeZkcCHFVE9nSl77
	dYBDGj0OlZ5Ge8Bg6S+nwyThVuDcKt+CAWOliBq6ydR2ZtTZKJqVZ44mriYcT4ZziLYjtCjKeY5l/
	SzZXe95oQ6DFJOpgFva+sIuWg1sxspz1xJ9D66UGNxI+k6Q8RbTTI9qJ3BJj0Z2cW9GjZDSsRYz5V
	/wxABtPJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lODVd-00AwyQ-8B; Mon, 22 Mar 2021 05:53:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lODVN-00AwwO-Nd; Mon, 22 Mar 2021 05:53:38 +0000
X-UUID: a9f0f9c83302419bb58130ce0668ade3-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DWhSzNDumgJNux8c1EtdJDcy6q/zzayTMpOqiZ8Wy2c=; 
 b=NkMzGfBdIWVDevvZ1CWXbPdGPsDsUr1A4tY1qp3mvqp+bsaOYCfeFX8rPEh9CmJ4PtT0d8ecRPn7GDs0aTYSvX1nYyhthfpepchLaJeoqSOTS8lAWy1wQ4pLP9i5qFoOUbbkLk62EZGKwPl/FLof+qCTu02pOAejkctsF8rtDnc=;
X-UUID: a9f0f9c83302419bb58130ce0668ade3-20210321
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 103482881; Sun, 21 Mar 2021 21:53:19 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 22:53:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 13:53:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 13:53:06 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <fparent@baylibre.com>, Leilk Liu <leilk.liu@mediatek.com>
Subject: [PATCH 3/4] spi: mediatek: add mtk_spi_compatible support
Date: Mon, 22 Mar 2021 13:52:43 +0800
Message-ID: <20210322055244.30179-4-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210322055244.30179-1-leilk.liu@mediatek.com>
References: <20210322055244.30179-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 569023D4B5FEB7772D85FCDC49AC3136A05674D1807D11B39F8C6507BF24F9562000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_055337_166933_CB9F6DA6 
X-CRM114-Status: GOOD (  16.32  )
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

this patch adds max_fifo_size and must_rx compat support.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-slave-mt27xx.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-slave-mt27xx.c b/drivers/spi/spi-slave-mt27xx.c
index 44edaa360405..7e6fadc88cef 100644
--- a/drivers/spi/spi-slave-mt27xx.c
+++ b/drivers/spi/spi-slave-mt27xx.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
+#include <linux/of.h>
+
 
 #define SPIS_IRQ_EN_REG		0x0
 #define SPIS_IRQ_CLR_REG	0x4
@@ -61,8 +63,6 @@
 #define SPIS_DMA_ADDR_EN	BIT(1)
 #define SPIS_SOFT_RST		BIT(0)
 
-#define MTK_SPI_SLAVE_MAX_FIFO_SIZE 512U
-
 struct mtk_spi_slave {
 	struct device *dev;
 	void __iomem *base;
@@ -70,10 +70,19 @@ struct mtk_spi_slave {
 	struct completion xfer_done;
 	struct spi_transfer *cur_transfer;
 	bool slave_aborted;
+	const struct mtk_spi_compatible *dev_comp;
 };
 
+struct mtk_spi_compatible {
+	const u32 max_fifo_size;
+	bool must_rx;
+};
+static const struct mtk_spi_compatible mt2712_compat = {
+	.max_fifo_size = 512,
+};
 static const struct of_device_id mtk_spi_slave_of_match[] = {
-	{ .compatible = "mediatek,mt2712-spi-slave", },
+	{ .compatible = "mediatek,mt2712-spi-slave",
+	  .data = (void *)&mt2712_compat,},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_spi_slave_of_match);
@@ -272,7 +281,7 @@ static int mtk_spi_slave_transfer_one(struct spi_controller *ctlr,
 	mdata->slave_aborted = false;
 	mdata->cur_transfer = xfer;
 
-	if (xfer->len > MTK_SPI_SLAVE_MAX_FIFO_SIZE)
+	if (xfer->len > mdata->dev_comp->max_fifo_size)
 		return mtk_spi_slave_dma_transfer(ctlr, spi, xfer);
 	else
 		return mtk_spi_slave_fifo_transfer(ctlr, spi, xfer);
@@ -369,6 +378,7 @@ static int mtk_spi_slave_probe(struct platform_device *pdev)
 	struct spi_controller *ctlr;
 	struct mtk_spi_slave *mdata;
 	int irq, ret;
+	const struct of_device_id *of_id;
 
 	ctlr = spi_alloc_slave(&pdev->dev, sizeof(*mdata));
 	if (!ctlr) {
@@ -386,7 +396,17 @@ static int mtk_spi_slave_probe(struct platform_device *pdev)
 	ctlr->setup = mtk_spi_slave_setup;
 	ctlr->slave_abort = mtk_slave_abort;
 
+	of_id = of_match_node(mtk_spi_slave_of_match, pdev->dev.of_node);
+	if (!of_id) {
+		dev_err(&pdev->dev, "failed to probe of_node\n");
+		ret = -EINVAL;
+		goto err_put_ctlr;
+	}
 	mdata = spi_controller_get_devdata(ctlr);
+	mdata->dev_comp = of_id->data;
+
+	if (mdata->dev_comp->must_rx)
+		ctlr->flags = SPI_MASTER_MUST_RX;
 
 	platform_set_drvdata(pdev, ctlr);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
