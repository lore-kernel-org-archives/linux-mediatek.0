Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FB7C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:34:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27DD6108B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27DD6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LG8Y4zZy3HvkhusWtzFyCK6fRtPp8rDGCx9fOBDz+no=; b=atShbASAVyQ0MM
	SjZy5KECINd+zwaRmo45CqxVnOVZlFZ5BeS0Rhr1JMQJfEpSnUmX9mjiMqc5oKvOMCD9i+jcrX/sr
	dsKMHR8Y15RV+Bjii+Dsxgc+voUyU0Mbss4TIEGHwDZ7Oz5yJIbMCHEbGQ/sDE2aH1Q/h0ZoR53DZ
	MqfMUWuH+Kha0nwrcddYoH0Bz7uCtnSlpPnK6iAw8OlMnolEsJpwWrnKGCpoKoNHHLDqzvpe/MBRO
	PyM54CQdwIpDtRPiz2bV1FcE4iNuXciTMKzLiSRB864IYbv/uT4ZGmzFwKAgi7PpjBcAbZ3aJHx5S
	EdEh2kBm3rvMqHmTUBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5PfY-0096q3-84; Mon, 19 Jul 2021 09:34:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5PfK-0096o3-6G; Mon, 19 Jul 2021 09:34:25 +0000
X-UUID: c8cdb7fe80cc45a0aeaf66b9a7abb277-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cg5/t/nn3vKVFVI8yaUncLj+TKkvackSYBpAE26A4rs=; 
 b=DPdBYJAGZpjh/szba/Wtrza1VSQmiq9d3Oc/1jbhyIuZI16KKe/SlHhNqbnBX4QhqO2KUnhtMR5AwR2AHXoc97U2TXJjhtHMIu8/co3UUoeT3sMTC//gS+AgCZSK14Y0TtIuYoawVlq85LXd85chKaY/tSzSfYiyR+m6lnKLL10=;
X-UUID: c8cdb7fe80cc45a0aeaf66b9a7abb277-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1223137262; Mon, 19 Jul 2021 02:34:21 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 02:32:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 17:32:15 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 17:32:15 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <leilk.liu@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Subject: [PATCH 1/3] spi: move cs spi_delay to spi_device
Date: Mon, 19 Jul 2021 17:16:12 +0800
Message-ID: <20210719091611.15303-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_023422_288529_82C6318E 
X-CRM114-Status: GOOD (  15.66  )
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

As we know, spi core layer has removed spi_set_cs_timing() API.
So this patch moved spi_delay for cs_timing from spi_controller
to spi_device, because cs timing should be set by spi_device but
not controller.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/spi/spi.c       |  6 +++---
 include/linux/spi/spi.h | 20 +++++++++-----------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c99181165321..5d68e6cd2a18 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -842,9 +842,9 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
 	if (spi->cs_gpiod || gpio_is_valid(spi->cs_gpio) ||
 	    !spi->controller->set_cs_timing) {
 		if (activate)
-			spi_delay_exec(&spi->controller->cs_setup, NULL);
+			spi_delay_exec(&spi->cs_setup, NULL);
 		else
-			spi_delay_exec(&spi->controller->cs_hold, NULL);
+			spi_delay_exec(&spi->cs_hold, NULL);
 	}
 
 	if (spi->mode & SPI_CS_HIGH)
@@ -887,7 +887,7 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
 	if (spi->cs_gpiod || gpio_is_valid(spi->cs_gpio) ||
 	    !spi->controller->set_cs_timing) {
 		if (!activate)
-			spi_delay_exec(&spi->controller->cs_inactive, NULL);
+			spi_delay_exec(&spi->cs_inactive, NULL);
 	}
 }
 
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 97b8d12b5f2b..651e19ba3415 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -147,7 +147,11 @@ extern int spi_delay_exec(struct spi_delay *_delay, struct spi_transfer *xfer);
  *	not using a GPIO line)
  * @word_delay: delay to be inserted between consecutive
  *	words of a transfer
- *
+ * @cs_setup: delay to be introduced by the controller after CS is asserted
+ * @cs_hold: delay to be introduced by the controller before CS is deasserted
+ * @cs_inactive: delay to be introduced by the controller after CS is
+ *	deasserted. If @cs_change_delay is used from @spi_transfer, then the
+ *	two delays will be added up.
  * @statistics: statistics for the spi_device
  *
  * A @spi_device is used to interchange data between an SPI slave
@@ -188,6 +192,10 @@ struct spi_device {
 	int			cs_gpio;	/* LEGACY: chip select gpio */
 	struct gpio_desc	*cs_gpiod;	/* chip select gpio desc */
 	struct spi_delay	word_delay; /* inter-word delay */
+	/* CS delays */
+	struct spi_delay	cs_setup;
+	struct spi_delay	cs_hold;
+	struct spi_delay	cs_inactive;
 
 	/* the statistics */
 	struct spi_statistics	statistics;
@@ -412,11 +420,6 @@ extern struct spi_device *spi_new_ancillary_device(struct spi_device *spi, u8 ch
  *	     controller has native support for memory like operations.
  * @unprepare_message: undo any work done by prepare_message().
  * @slave_abort: abort the ongoing transfer request on an SPI slave controller
- * @cs_setup: delay to be introduced by the controller after CS is asserted
- * @cs_hold: delay to be introduced by the controller before CS is deasserted
- * @cs_inactive: delay to be introduced by the controller after CS is
- *	deasserted. If @cs_change_delay is used from @spi_transfer, then the
- *	two delays will be added up.
  * @cs_gpios: LEGACY: array of GPIO descs to use as chip select lines; one per
  *	CS number. Any individual value may be -ENOENT for CS lines that
  *	are not GPIOs (driven by the SPI controller itself). Use the cs_gpiods
@@ -638,11 +641,6 @@ struct spi_controller {
 	/* Optimized handlers for SPI memory-like operations. */
 	const struct spi_controller_mem_ops *mem_ops;
 
-	/* CS delays */
-	struct spi_delay	cs_setup;
-	struct spi_delay	cs_hold;
-	struct spi_delay	cs_inactive;
-
 	/* gpio chip select */
 	int			*cs_gpios;
 	struct gpio_desc	**cs_gpiods;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
