Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C591EC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 03:10:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B6364E8F
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 03:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81B6364E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UyHh7oE+E1HrM3XEWgs/nyx4BdldpDfFN+dnyEHJ2gw=; b=uHsNRYhVGukbv23uCj7ZUXXDS
	R819HJ0kkf3VzIAVqdXpqy5nP1+YK5eO62cA8ZSzGKsPrCkoyNe5/rfUBqIoW8hGksZWziPc3gtvw
	auO1FOE4a8e8vRHXj4DPxgKL1NPFaWOeelDRAj83AgVTBiRZ5H4LnnR6WxnRtRoipIvdcfThlh9jT
	MJzLw+XaNaPdVjzod47RJ+pyFISeMT0HIT3KJBHaupK4RM9zIQV3qRktRzaVHtcWkYD/QDVQhesHQ
	ykGPMJGj5JDhiO3idjRlv+ZT2gOMc5wgKpHZZAfohzz+ez0+rTqo++/NuchSBPBsELPn4yz8yKmYY
	pH4RQHM8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8aTD-0008KS-9Z; Sun, 07 Feb 2021 03:10:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8aT1-0008Gl-HU; Sun, 07 Feb 2021 03:10:32 +0000
X-UUID: 73c159845fcf4de68f960c1355ba9e1e-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KPLvAKJ/PxI/PuuGNkL68nC723j3sDO+blh2F0WvV18=; 
 b=Qvsz3kykTHAdIhFJ3pUvy2Y8UEhb7NFwPT5EVbQoZk4EJtVKTI3bviCaULWbzZgyeyEnZ9JQVJGFhBAUcaOP0utzVGD0S0z3Oxwm4X2HN49Ep0JQt6xM+tdnSDce901GpgIl7HJQ2X41p94NZu59PX9p8TOJcvqy2IofToU/XcM=;
X-UUID: 73c159845fcf4de68f960c1355ba9e1e-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 717358358; Sat, 06 Feb 2021 19:10:24 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 19:10:23 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 11:10:14 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 7 Feb 2021 11:10:13 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] spi: mediatek: add set_cs_timing support
Date: Sun, 7 Feb 2021 11:09:53 +0800
Message-ID: <20210207030953.9297-4-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210207030953.9297-1-leilk.liu@mediatek.com>
References: <20210207030953.9297-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 88A888439914E51094B2DFCB96BE1DB211E69AF1E5C0A9D396EBDCAF1B00F0132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_221031_784101_9972A18B 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "leilk.liu" <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "leilk.liu" <leilk.liu@mediatek.com>

this patch add set_cs_timing support for HW CS mode.

Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 72 +++++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 5d643051bf3d..976f73b9e299 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -287,7 +287,7 @@ static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 static void mtk_spi_prepare_transfer(struct spi_master *master,
 				     struct spi_transfer *xfer)
 {
-	u32 spi_clk_hz, div, sck_time, cs_time, reg_val;
+	u32 spi_clk_hz, div, sck_time, reg_val;
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 
 	spi_clk_hz = clk_get_rate(mdata->spi_clk);
@@ -297,32 +297,25 @@ static void mtk_spi_prepare_transfer(struct spi_master *master,
 		div = 1;
 
 	sck_time = (div + 1) / 2;
-	cs_time = sck_time * 2;
 
 	if (mdata->dev_comp->enhance_timing) {
-		reg_val = (((sck_time - 1) & 0xffff)
+		reg_val = readl(mdata->base + SPI_CFG2_REG);
+		reg_val &= ~(0xffff << SPI_CFG2_SCK_HIGH_OFFSET);
+		reg_val |= (((sck_time - 1) & 0xffff)
 			   << SPI_CFG2_SCK_HIGH_OFFSET);
+		reg_val &= ~(0xffff << SPI_CFG2_SCK_LOW_OFFSET);
 		reg_val |= (((sck_time - 1) & 0xffff)
 			   << SPI_CFG2_SCK_LOW_OFFSET);
 		writel(reg_val, mdata->base + SPI_CFG2_REG);
-		reg_val = (((cs_time - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((cs_time - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
-		writel(reg_val, mdata->base + SPI_CFG0_REG);
 	} else {
-		reg_val = (((sck_time - 1) & 0xff)
+		reg_val = readl(mdata->base + SPI_CFG0_REG);
+		reg_val &= ~(0xff << SPI_CFG0_SCK_HIGH_OFFSET);
+		reg_val |= (((sck_time - 1) & 0xff)
 			   << SPI_CFG0_SCK_HIGH_OFFSET);
+		reg_val &= ~(0xff << SPI_CFG0_SCK_LOW_OFFSET);
 		reg_val |= (((sck_time - 1) & 0xff) << SPI_CFG0_SCK_LOW_OFFSET);
-		reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG0_CS_SETUP_OFFSET);
 		writel(reg_val, mdata->base + SPI_CFG0_REG);
 	}
-
-	reg_val = readl(mdata->base + SPI_CFG1_REG);
-	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
-	reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
-	writel(reg_val, mdata->base + SPI_CFG1_REG);
 }
 
 static void mtk_spi_setup_packet(struct spi_master *master)
@@ -513,6 +506,52 @@ static bool mtk_spi_can_dma(struct spi_master *master,
 		(unsigned long)xfer->rx_buf % 4 == 0);
 }
 
+static int mtk_spi_set_hw_cs_timing(struct spi_device *spi,
+				    struct spi_delay *setup,
+				    struct spi_delay *hold,
+				    struct spi_delay *inactive)
+{
+	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
+	u16 setup_dly, hold_dly, inactive_dly;
+	u32 reg_val;
+
+	if ((setup && setup->unit != SPI_DELAY_UNIT_SCK) ||
+	    (hold && hold->unit != SPI_DELAY_UNIT_SCK) ||
+	    (inactive && inactive->unit != SPI_DELAY_UNIT_SCK)) {
+		dev_err(&spi->dev,
+			"Invalid delay unit, should be SPI_DELAY_UNIT_SCK\n");
+		return -EINVAL;
+	}
+
+	setup_dly = setup ? setup->value : 1;
+	hold_dly = hold ? hold->value : 1;
+	inactive_dly = inactive ? inactive->value : 1;
+
+	reg_val = readl(mdata->base + SPI_CFG0_REG);
+	if (mdata->dev_comp->enhance_timing) {
+		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
+		reg_val |= (((hold_dly - 1) & 0xffff)
+			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
+		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
+		reg_val |= (((setup_dly - 1) & 0xffff)
+			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
+	} else {
+		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
+		reg_val |= (((hold_dly - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
+		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
+		reg_val |= (((setup_dly - 1) & 0xff)
+			    << SPI_CFG0_CS_SETUP_OFFSET);
+	}
+	writel(reg_val, mdata->base + SPI_CFG0_REG);
+
+	reg_val = readl(mdata->base + SPI_CFG1_REG);
+	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
+	reg_val |= (((inactive_dly - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
+	writel(reg_val, mdata->base + SPI_CFG1_REG);
+
+	return 0;
+}
+
 static int mtk_spi_setup(struct spi_device *spi)
 {
 	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
@@ -644,6 +683,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	master->transfer_one = mtk_spi_transfer_one;
 	master->can_dma = mtk_spi_can_dma;
 	master->setup = mtk_spi_setup;
+	master->set_cs_timing = mtk_spi_set_hw_cs_timing;
 
 	of_id = of_match_node(mtk_spi_of_match, pdev->dev.of_node);
 	if (!of_id) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
