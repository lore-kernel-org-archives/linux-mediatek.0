Return-Path: <SRS0=+oxs=ZK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE91FC43215
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 04:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 735DC2071C
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 04:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KE/BI1xT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n/+Br/+7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 735DC2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRDgzcCokOHQb3b4KZn8i7vu/2TaY5+hGJ7DmATWyxw=; b=KE/BI1xTKbjzIc
	H9aI8QQrVsZTZbY4ysabXFSkgAYXXwUiAjFY7OxSAy0M6urWgafYCVIBQHn+kxSxZzA+iL+M5CbiP
	tjx5n2PINYKiLwK+WeLNqNAelkSh0mlkW/0BzPzcSxZXkhp4qx3eUeCN6nHxtAiS+RZexwrap6B9N
	W5Px8l2P9yi4v7nMaw1uV5la1JgrLOLR/IzHa5274eWjiyj81QXocPsK8sdrR/Q/Zq4yK9aNNlGwn
	OghA59efz/ZD3sRWCQ0G0T8+eZJzZYi2/x89TBHyohVGCK6EWOWSJmDJkaSRamMRM/zQsBDfyOA2a
	tVcs61cNB31EJnfibYOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWZ7K-0008NK-SR; Mon, 18 Nov 2019 04:58:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWZ7G-0008Kw-Gg; Mon, 18 Nov 2019 04:58:24 +0000
X-UUID: 86dcd404b4a14ab792db3413ca24b3bc-20191117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UHP1TLO/xSCKu2mOHO9OAMb60Y2rR1gXwyO+sDfrAaA=; 
 b=n/+Br/+7zUI9odvCzit6ZwUVdJM0Q0PySvGNhBk7x+asFB4Gek2XWZXNX17AIrXzyF/ZfZDSxsUgg6d99jDxCwDLMHZl07ryJUh10JE7ls3WUthWq5p64gBqpEYlQ2iZTu6VyFCO/mdZnk9DbpamxJcYk6qCi3ohgJ4uB9jtCmc=;
X-UUID: 86dcd404b4a14ab792db3413ca24b3bc-20191117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <luhua.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1175610169; Sun, 17 Nov 2019 20:58:19 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 17 Nov 2019 20:58:20 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 18 Nov 2019 12:58:01 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 18 Nov 2019 12:57:52 +0800
From: Luhua Xu <luhua.xu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Allison Randal <allison@lohutok.net>, "Enrico
 Weigelt" <info@metux.net>, Kate Stewart <kstewart@linuxfoundation.org>,
 "Leilk Liu" <leilk.liu@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/2] spi: mediatek: add cs timing configuration support
Date: Mon, 18 Nov 2019 12:57:17 +0800
Message-ID: <1574053037-26721-3-git-send-email-luhua.xu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1574053037-26721-1-git-send-email-luhua.xu@mediatek.com>
References: <1574053037-26721-1-git-send-email-luhua.xu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 626524C0662AC8EB3D01DB687214712F64B2E88F0CAD8E749B2E550F40EB27E92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_205822_569594_9BBA2E7D 
X-CRM114-Status: GOOD (  12.18  )
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
Cc: Luhua Xu <luhua.xu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add configure SPI CS setup/hold/idle delays in terms
of clk count support, and use one period of current
spi speed as default if setup/hold/idle not indicated.

Signed-off-by: Luhua Xu <luhua.xu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c                 | 41 +++++++++++++++++++++++++-------
 include/linux/platform_data/spi-mt65xx.h |  5 ++++
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index f599cce..98df9d1 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -140,6 +140,9 @@ static const struct mtk_spi_compatible mt8183_compat = {
  */
 static const struct mtk_chip_config mtk_default_chip_info = {
 	.sample_sel = 0,
+	.setup_cnt = 0,
+	.hold_cnt = 0,
+	.idle_cnt = 0,
 };
 
 static const struct of_device_id mtk_spi_of_match[] = {
@@ -281,10 +284,13 @@ static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 }
 
 static void mtk_spi_prepare_transfer(struct spi_master *master,
-				     struct spi_transfer *xfer)
+				     struct spi_transfer *xfer,
+				     struct spi_device *spi)
 {
 	u32 spi_clk_hz, div, sck_time, cs_time, reg_val = 0;
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
+	struct mtk_chip_config *chip_config = spi->controller_data;
+	u32 cs_setup, cs_hold, cs_idle;
 
 	spi_clk_hz = clk_get_rate(mdata->spi_clk);
 	if (xfer->speed_hz < spi_clk_hz / 2)
@@ -295,29 +301,46 @@ static void mtk_spi_prepare_transfer(struct spi_master *master,
 	sck_time = (div + 1) / 2;
 	cs_time = sck_time * 2;
 
+	if (chip_config->setup_cnt)
+		cs_setup = chip_config->setup_cnt;
+	else
+		cs_setup = cs_time;
+
+	if (chip_config->hold_cnt)
+		cs_hold = chip_config->hold_cnt;
+	else
+		cs_hold = cs_time;
+
+	if (chip_config->idle_cnt)
+		cs_idle = chip_config->idle_cnt;
+	else
+		cs_idle = cs_time;
+
 	if (mdata->dev_comp->enhance_timing) {
-		reg_val |= (((sck_time - 1) & 0xffff)
+		reg_val = (((sck_time - 1) & 0xffff)
 			   << SPI_CFG0_SCK_HIGH_OFFSET);
 		reg_val |= (((sck_time - 1) & 0xffff)
 			   << SPI_ADJUST_CFG0_SCK_LOW_OFFSET);
 		writel(reg_val, mdata->base + SPI_CFG2_REG);
-		reg_val |= (((cs_time - 1) & 0xffff)
+
+		reg_val = (((cs_hold - 1) & 0xffff)
 			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((cs_time - 1) & 0xffff)
+		reg_val |= (((cs_setup - 1) & 0xffff)
 			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
 		writel(reg_val, mdata->base + SPI_CFG0_REG);
 	} else {
 		reg_val |= (((sck_time - 1) & 0xff)
 			   << SPI_CFG0_SCK_HIGH_OFFSET);
 		reg_val |= (((sck_time - 1) & 0xff) << SPI_CFG0_SCK_LOW_OFFSET);
-		reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
-		reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG0_CS_SETUP_OFFSET);
+		reg_val |= (((cs_hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
+		reg_val |= (((cs_setup - 1) & 0xff)
+			   << SPI_CFG0_CS_SETUP_OFFSET);
 		writel(reg_val, mdata->base + SPI_CFG0_REG);
 	}
 
 	reg_val = readl(mdata->base + SPI_CFG1_REG);
 	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
-	reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
+	reg_val |= (((cs_idle - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
 	writel(reg_val, mdata->base + SPI_CFG1_REG);
 }
 
@@ -426,7 +449,7 @@ static int mtk_spi_fifo_transfer(struct spi_master *master,
 	mdata->cur_transfer = xfer;
 	mdata->xfer_len = min(MTK_SPI_MAX_FIFO_SIZE, xfer->len);
 	mdata->num_xfered = 0;
-	mtk_spi_prepare_transfer(master, xfer);
+	mtk_spi_prepare_transfer(master, xfer, spi);
 	mtk_spi_setup_packet(master);
 
 	cnt = xfer->len / 4;
@@ -458,7 +481,7 @@ static int mtk_spi_dma_transfer(struct spi_master *master,
 	mdata->cur_transfer = xfer;
 	mdata->num_xfered = 0;
 
-	mtk_spi_prepare_transfer(master, xfer);
+	mtk_spi_prepare_transfer(master, xfer, spi);
 
 	cmd = readl(mdata->base + SPI_CMD_REG);
 	if (xfer->tx_buf)
diff --git a/include/linux/platform_data/spi-mt65xx.h b/include/linux/platform_data/spi-mt65xx.h
index 65fd5ffd2..80d280e 100644
--- a/include/linux/platform_data/spi-mt65xx.h
+++ b/include/linux/platform_data/spi-mt65xx.h
@@ -12,5 +12,10 @@
 /* Board specific platform_data */
 struct mtk_chip_config {
 	u32 sample_sel;
+
+	/* CS timing configuration in terms of clock count */
+	u16 setup_cnt;
+	u16 hold_cnt;
+	u8  idle_cnt;
 };
 #endif
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
