Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 12:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA3C615E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 12:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AA3C615E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=htFJUQzSXtBkqhJZbeY0YooDIKg4M8Sqq/vDBoWM3AI=; b=iBnXZYkoveZlca
	StmAiJKSZEfW4IO0cHPDFsoeYuTHif1jWCPDvgoV9GHbl/kj/lsXeXs/+8FAghBUpsC1eRUcOaPbD
	QpCOwBxAOPv7VpBXBgs370auvIweE8/xUH6kvyaSJF2bFKkGG9GJbpobIs6rad+lQowdl6iQ9odFT
	8b6mm1qVO3+6LDCv8XawBQGAffvVbQ+G+TOf9t3II19NWrGLu2SS5hlM7njkrbZut08Q2ykyt5AJI
	Ogu495RN9/aT8e9vBJrjAzTitFCFdZSe0D4ADz5CqTPkiUMDon5KbbyONbGFNHEiELY8X94P6sbXm
	6PuRHIbQIHEDOxUoBiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVuqQ-00E7ze-ED; Thu, 30 Sep 2021 12:07:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVuqD-00E7xD-HZ; Thu, 30 Sep 2021 12:07:11 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6AAF51F44AD8;
 Thu, 30 Sep 2021 13:07:07 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: broonie@kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 linux-spi@vger.kernel.org, enric.balletbo@collabora.com, dafna3@gmail.com,
 Mason Zhang <Mason.Zhang@mediatek.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] Revert "spi: modify set_cs_timing parameter"
Date: Thu, 30 Sep 2021 14:07:00 +0200
Message-Id: <20210930120700.2564-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_050709_866896_0EEB227F 
X-CRM114-Status: GOOD (  15.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 04e6bb0d6bb127bac929fb35edd2dd01613c9520.

This revert the commit 'spi: modify set_cs_timing parameter'
and its following commit
'spi: mediatek: fix build warnning in set cs timing'.

Those commits cause regression on mt8173 elm device. The EC either is not
able to register or it sends numerous amount of errors:

cros-ec-i2c-tunnel 1100a000.spi:ec@0:i2c-tunnel0: Error transferring EC i2c message -71
cros-ec-spi spi0.0: EC failed to respond in time.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/spi/spi-mt65xx.c   | 107 ++++++++++++++++---------------------
 drivers/spi/spi-tegra114.c |   8 +--
 include/linux/spi/spi.h    |   3 +-
 3 files changed, 52 insertions(+), 66 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 386e8c84be0a..aa7da41a8bd0 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -208,65 +208,6 @@ static void mtk_spi_reset(struct mtk_spi *mdata)
 	writel(reg_val, mdata->base + SPI_CMD_REG);
 }
 
-static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
-{
-	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
-	struct spi_delay *cs_setup = &spi->cs_setup;
-	struct spi_delay *cs_hold = &spi->cs_hold;
-	struct spi_delay *cs_inactive = &spi->cs_inactive;
-	u32 setup, hold, inactive;
-	u32 reg_val;
-	int delay;
-
-	delay = spi_delay_to_ns(cs_setup, NULL);
-	if (delay < 0)
-		return delay;
-	setup = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
-
-	delay = spi_delay_to_ns(cs_hold, NULL);
-	if (delay < 0)
-		return delay;
-	hold = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
-
-	delay = spi_delay_to_ns(cs_inactive, NULL);
-	if (delay < 0)
-		return delay;
-	inactive = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
-
-	setup    = setup ? setup : 1;
-	hold     = hold ? hold : 1;
-	inactive = inactive ? inactive : 1;
-
-	reg_val = readl(mdata->base + SPI_CFG0_REG);
-	if (mdata->dev_comp->enhance_timing) {
-		hold = min_t(u32, hold, 0x10000);
-		setup = min_t(u32, setup, 0x10000);
-		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((hold - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
-		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
-		reg_val |= (((setup - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
-	} else {
-		hold = min_t(u32, hold, 0x100);
-		setup = min_t(u32, setup, 0x100);
-		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
-		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
-		reg_val |= (((setup - 1) & 0xff)
-			    << SPI_CFG0_CS_SETUP_OFFSET);
-	}
-	writel(reg_val, mdata->base + SPI_CFG0_REG);
-
-	inactive = min_t(u32, inactive, 0x100);
-	reg_val = readl(mdata->base + SPI_CFG1_REG);
-	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
-	reg_val |= (((inactive - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
-	writel(reg_val, mdata->base + SPI_CFG1_REG);
-
-	return 0;
-}
-
 static int mtk_spi_prepare_message(struct spi_master *master,
 				   struct spi_message *msg)
 {
@@ -343,8 +284,6 @@ static int mtk_spi_prepare_message(struct spi_master *master,
 		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
 	writel(reg_val, mdata->base + SPI_CFG1_REG);
 
-	/* set hw cs timing */
-	mtk_spi_set_hw_cs_timing(spi);
 	return 0;
 }
 
@@ -590,6 +529,52 @@ static bool mtk_spi_can_dma(struct spi_master *master,
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
diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
index e9de1d958bbd..5131141bbf0d 100644
--- a/drivers/spi/spi-tegra114.c
+++ b/drivers/spi/spi-tegra114.c
@@ -717,12 +717,12 @@ static void tegra_spi_deinit_dma_param(struct tegra_spi_data *tspi,
 	dma_release_channel(dma_chan);
 }
 
-static int tegra_spi_set_hw_cs_timing(struct spi_device *spi)
+static int tegra_spi_set_hw_cs_timing(struct spi_device *spi,
+				      struct spi_delay *setup,
+				      struct spi_delay *hold,
+				      struct spi_delay *inactive)
 {
 	struct tegra_spi_data *tspi = spi_master_get_devdata(spi->master);
-	struct spi_delay *setup = &spi->cs_setup;
-	struct spi_delay *hold = &spi->cs_hold;
-	struct spi_delay *inactive = &spi->cs_inactive;
 	u8 setup_dly, hold_dly, inactive_dly;
 	u32 setup_hold;
 	u32 spi_cs_timing;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 8371bca13729..1efe2e08957e 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -554,7 +554,8 @@ struct spi_controller {
 	 * to configure specific CS timing through spi_set_cs_timing() after
 	 * spi_setup().
 	 */
-	int (*set_cs_timing)(struct spi_device *spi);
+	int (*set_cs_timing)(struct spi_device *spi, struct spi_delay *setup,
+			     struct spi_delay *hold, struct spi_delay *inactive);
 
 	/* bidirectional bulk transfers
 	 *
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
