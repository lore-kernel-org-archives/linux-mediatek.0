Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB1FC636C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:59:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BBDB61175
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BBDB61175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fX6+VqOIm+kVRqenfiAqoScL0O0JeBLw1UmN0r4BR24=; b=Mh2UUz0K2JqzLG
	FBK7KDUlGQlB2mU3kZRtYtceSnz4EO/ct5u32RqR7Eg116aPgJURExZSycZtG0V8exQaauh3Jumi8
	+atYWoOttpn0VwoAaj+icTECJG4E44/t5RG+nIDfIumUfU/e839+DuuVys2Oqkp3/zuwlioJL/hHY
	11s0UqC+Hs6M0RfTiNgpg9h50rSQjIuK9t0L0rAB9B+mLKZhYfrKKUX4ThBbWtKZLlf6a6B68Vc3B
	4l2mbHHSVziPD8fnc79o7UGEgrvGICSqhZ+78cVDaGn8g5OQxz2q8ED47HGl3bRaLC3l8l5Hvszpr
	drjj2DnX7BBIRNJAVVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Q3B-009A1x-IR; Mon, 19 Jul 2021 09:59:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Q2l-0099qr-AB; Mon, 19 Jul 2021 09:58:37 +0000
X-UUID: f9ede8224abd4cf5a14765d0e1d799ec-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xV7nHgZxpRcUmlwuTPj/vGDyd83owhdQlP3Xdm9E7P4=; 
 b=le9J4aP9Tls40CO6SOdItinvzLUr395HiVbbPfhrBS4qgjwUg6nZuqDK9P9b1udbVxR6lwWVNITUleeW7bLD5dFUPqzMqSqxO/Z4i/2JBSi1JGuP7uirh6X95r+8TmdZaccYN0GOH+F/6Fps4NWoNW6jYuis0HGGtmdbjdsO5Rw=;
X-UUID: f9ede8224abd4cf5a14765d0e1d799ec-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1533760694; Mon, 19 Jul 2021 02:58:33 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 02:48:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 17:33:24 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 17:33:24 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <leilk.liu@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Subject: [PATCH 3/3] spi: mediatek: modify set_cs_timing callback
Date: Mon, 19 Jul 2021 17:17:08 +0800
Message-ID: <20210719091707.31664-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_025835_462574_6843CBAC 
X-CRM114-Status: GOOD (  12.56  )
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

From: Mason Zhang <Mason.Zhang@mediatek.com>

This patch modified set_cs_timing callback:
1. support spi_device set cs_timing in their driver;
2. support set absolute time but no clk count, because;
clk src will change in different platform;
3. call this function in prepare_message but not in other API.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 102 +++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 46 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 6f2925118b98..7a34f5b1201d 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -208,6 +208,60 @@ static void mtk_spi_reset(struct mtk_spi *mdata)
 	writel(reg_val, mdata->base + SPI_CMD_REG);
 }
 
+static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
+{
+	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
+	struct spi_delay *cs_setup = &spi->cs_setup;
+	struct spi_delay *cs_hold = &spi->cs_hold;
+	struct spi_delay *cs_inactive = &spi->cs_inactive;
+	u16 setup, hold, inactive;
+	u32 reg_val;
+	int delay;
+
+	delay = spi_delay_to_ns(cs_setup, NULL);
+	if (delay < 0)
+		return delay;
+	setup = (delay / 1000) * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000);
+
+	delay = spi_delay_to_ns(cs_hold, NULL);
+	if (delay < 0)
+		return delay;
+	hold = (delay / 1000) * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000);
+
+	delay = spi_delay_to_ns(cs_inactive, NULL);
+	if (delay < 0)
+		return delay;
+	inactive = (delay / 1000) * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000);
+
+	setup    = setup ? setup : 1;
+	hold     = hold ? hold : 1;
+	inactive = inactive ? inactive : 1;
+
+	reg_val = readl(mdata->base + SPI_CFG0_REG);
+	if (mdata->dev_comp->enhance_timing) {
+		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
+		reg_val |= (((hold - 1) & 0xffff)
+			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
+		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
+		reg_val |= (((setup - 1) & 0xffff)
+			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
+	} else {
+		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
+		reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
+		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
+		reg_val |= (((setup - 1) & 0xff)
+			    << SPI_CFG0_CS_SETUP_OFFSET);
+	}
+	writel(reg_val, mdata->base + SPI_CFG0_REG);
+
+	reg_val = readl(mdata->base + SPI_CFG1_REG);
+	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
+	reg_val |= (((inactive - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
+	writel(reg_val, mdata->base + SPI_CFG1_REG);
+
+	return 0;
+}
+
 static int mtk_spi_prepare_message(struct spi_master *master,
 				   struct spi_message *msg)
 {
@@ -284,6 +338,8 @@ static int mtk_spi_prepare_message(struct spi_master *master,
 		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
 	writel(reg_val, mdata->base + SPI_CFG1_REG);
 
+	/* set hw cs timing */
+	mtk_spi_set_hw_cs_timing(spi);
 	return 0;
 }
 
@@ -528,52 +584,6 @@ static bool mtk_spi_can_dma(struct spi_master *master,
 		(unsigned long)xfer->rx_buf % 4 == 0);
 }
 
-static int mtk_spi_set_hw_cs_timing(struct spi_device *spi,
-				    struct spi_delay *setup,
-				    struct spi_delay *hold,
-				    struct spi_delay *inactive)
-{
-	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
-	u16 setup_dly, hold_dly, inactive_dly;
-	u32 reg_val;
-
-	if ((setup && setup->unit != SPI_DELAY_UNIT_SCK) ||
-	    (hold && hold->unit != SPI_DELAY_UNIT_SCK) ||
-	    (inactive && inactive->unit != SPI_DELAY_UNIT_SCK)) {
-		dev_err(&spi->dev,
-			"Invalid delay unit, should be SPI_DELAY_UNIT_SCK\n");
-		return -EINVAL;
-	}
-
-	setup_dly = setup ? setup->value : 1;
-	hold_dly = hold ? hold->value : 1;
-	inactive_dly = inactive ? inactive->value : 1;
-
-	reg_val = readl(mdata->base + SPI_CFG0_REG);
-	if (mdata->dev_comp->enhance_timing) {
-		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((hold_dly - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
-		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
-		reg_val |= (((setup_dly - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
-	} else {
-		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((hold_dly - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
-		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
-		reg_val |= (((setup_dly - 1) & 0xff)
-			    << SPI_CFG0_CS_SETUP_OFFSET);
-	}
-	writel(reg_val, mdata->base + SPI_CFG0_REG);
-
-	reg_val = readl(mdata->base + SPI_CFG1_REG);
-	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
-	reg_val |= (((inactive_dly - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
-	writel(reg_val, mdata->base + SPI_CFG1_REG);
-
-	return 0;
-}
-
 static int mtk_spi_setup(struct spi_device *spi)
 {
 	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
