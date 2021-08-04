Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83277C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 13:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC1B60EE9
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 13:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AC1B60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cBdi7NlSdxI/pJztUiu84nP0OyBwZD+H1ZUG7CrVb88=; b=VPIErC8kQoLmMU
	f4ag+zy3ItFrMq0Zp5B9u7tnIXd1hnbJ2q7ladIUnmY1abuOTTghyo1dO/mrVHprQn2nzy9A0C+tk
	9pkFSLns9jwxus9L2CpAP/tFlfvjvwLMLSv6bdlwRRDUSFrZovd6Sn6HFMJlxD4Zo5LgAKaITcuTg
	nWAtp18U1HKtuKSQpUEq6OQhwYWqT85owdbFW91X6e5cdBdWqCVfxnFgXYqpL1wKNuwozlkAyOnMu
	PT8bb+HJJ1f++LtoP3qLavHVRjNtTVHTLLopIoKBN43URQwzj9vZCCdlTI1SuIk/mwcTTZHYaTCi8
	c3W0i7IfwwclITuCTBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHMW-006DlB-UI; Wed, 04 Aug 2021 13:55:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHMJ-006DgM-Dn; Wed, 04 Aug 2021 13:55:01 +0000
X-UUID: 4149e57c8b194cbc80305329fcd3a239-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=W0JkYnO/xDsBXEHCyC3uVoERUrscxtKz+GG+hk4fZKw=; 
 b=pRODI3Y2ntz7zYksJH2cwjXfDHAU0FltzC4wFCJcJaACHf9VOmmJgI5zPhH/VrWPUnmlXlQrTO1ts1sYVOmlc+1c0RQr7Fv7QXp8cQLzpIMBVQJtbFiwrJYhtwMZk9p1oj1jwaJS2yMUtM8Xc3mfrGfTxS3B3OSA1W6L4530xy0=;
X-UUID: 4149e57c8b194cbc80305329fcd3a239-20210804
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 107272923; Wed, 04 Aug 2021 06:54:53 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 06:54:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 21:54:50 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 Aug 2021 21:54:49 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, "Mason
 Zhang" <Mason.Zhang@mediatek.com>
Subject: [PATCH v3 2/2] spi: modify set_cs_timing parameter
Date: Wed, 4 Aug 2021 21:37:47 +0800
Message-ID: <20210804133746.6742-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_065459_522980_B6AB23C3 
X-CRM114-Status: GOOD (  17.25  )
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

This patch modified set_cs_timing parameter, no need pass in spi_delay
to set_cs_timing callback.
By the way, we modified the mediatek and tegra114 spi driver to fix build err.
In mediatek spi driver, We have support set absolute time not clk_count,
and call this function in prepare_message not user's API.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/spi/spi-mt65xx.c   | 107 +++++++++++++++++++++----------------
 drivers/spi/spi-tegra114.c |   8 +--
 include/linux/spi/spi.h    |   3 +-
 3 files changed, 66 insertions(+), 52 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 6f2925118b98..bb09592bc009 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -208,6 +208,65 @@ static void mtk_spi_reset(struct mtk_spi *mdata)
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
+	setup = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
+
+	delay = spi_delay_to_ns(cs_hold, NULL);
+	if (delay < 0)
+		return delay;
+	hold = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
+
+	delay = spi_delay_to_ns(cs_inactive, NULL);
+	if (delay < 0)
+		return delay;
+	inactive = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
+
+	setup    = setup ? setup : 1;
+	hold     = hold ? hold : 1;
+	inactive = inactive ? inactive : 1;
+
+	reg_val = readl(mdata->base + SPI_CFG0_REG);
+	if (mdata->dev_comp->enhance_timing) {
+		hold = min(hold, 0xffff);
+		setup = min(setup, 0xffff);
+		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
+		reg_val |= (((hold - 1) & 0xffff)
+			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
+		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
+		reg_val |= (((setup - 1) & 0xffff)
+			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
+	} else {
+		hold = min(hold, 0xff);
+		setup = min(setup, 0xff);
+		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
+		reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
+		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
+		reg_val |= (((setup - 1) & 0xff)
+			    << SPI_CFG0_CS_SETUP_OFFSET);
+	}
+	writel(reg_val, mdata->base + SPI_CFG0_REG);
+
+	inactive = min(inactive, 0xff);
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
@@ -284,6 +343,8 @@ static int mtk_spi_prepare_message(struct spi_master *master,
 		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
 	writel(reg_val, mdata->base + SPI_CFG1_REG);
 
+	/* set hw cs timing */
+	mtk_spi_set_hw_cs_timing(spi);
 	return 0;
 }
 
@@ -528,52 +589,6 @@ static bool mtk_spi_can_dma(struct spi_master *master,
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
diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
index 5131141bbf0d..e9de1d958bbd 100644
--- a/drivers/spi/spi-tegra114.c
+++ b/drivers/spi/spi-tegra114.c
@@ -717,12 +717,12 @@ static void tegra_spi_deinit_dma_param(struct tegra_spi_data *tspi,
 	dma_release_channel(dma_chan);
 }
 
-static int tegra_spi_set_hw_cs_timing(struct spi_device *spi,
-				      struct spi_delay *setup,
-				      struct spi_delay *hold,
-				      struct spi_delay *inactive)
+static int tegra_spi_set_hw_cs_timing(struct spi_device *spi)
 {
 	struct tegra_spi_data *tspi = spi_master_get_devdata(spi->master);
+	struct spi_delay *setup = &spi->cs_setup;
+	struct spi_delay *hold = &spi->cs_hold;
+	struct spi_delay *inactive = &spi->cs_inactive;
 	u8 setup_dly, hold_dly, inactive_dly;
 	u32 setup_hold;
 	u32 spi_cs_timing;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 651e19ba3415..fe027efb85c2 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -553,8 +553,7 @@ struct spi_controller {
 	 * to configure specific CS timing through spi_set_cs_timing() after
 	 * spi_setup().
 	 */
-	int (*set_cs_timing)(struct spi_device *spi, struct spi_delay *setup,
-			     struct spi_delay *hold, struct spi_delay *inactive);
+	int (*set_cs_timing)(struct spi_device *spi);
 
 	/* bidirectional bulk transfers
 	 *
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
