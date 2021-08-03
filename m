Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8258C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:41:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F06F60F93
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F06F60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KFX2UaBLB9JGSvEvn/GNA7cv8D1EbWFIPSzLeDmxyE8=; b=vrkHWrkbE5wLjm
	CaX6uD1osVdwd6Pp0kwXGZFj1PCryalPQBfnObP4v5HNT+ANHJhPjXXzzDxxMS34wzngJX2HB6l6Q
	YdyiKqhWvnU8op8noZejuj1xPZeUDXGU9QGWZ7dRs96d/zU+Tp/allfPdRfDUeQb6l6oCcte1d/uQ
	P2ZV/3ys/07KxoUSt2H+Fl/PUNzstPDTvsUxD7U0/KjVdgb+7syJkCvNKTe1Prt1JyIYnuftignbJ
	rd5A8+eCRS6Lybx+ZZ30w95CllKDo78VsT6zatlgnK6D7HFNgVdOJ3UVhJEkr9fQeBPI5Cvp9xFjU
	dtoEEuRMkQXB4hS3Q6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mArrl-00277g-Vb; Tue, 03 Aug 2021 10:41:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mArqK-0026QQ-VO; Tue, 03 Aug 2021 10:40:18 +0000
X-UUID: f3718e36bf9343899e3e7ffec82eec9b-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WJz8ckM9XDIJLsrxewPs0KSs3L87Hnpo2vFaJcej/ak=; 
 b=bCXnRrOFnlxHZzjgnqtelZw7uAkBeE0OhpWUIkBVw4KcqjDYvDZFc3Bu3J46c30U80rOQeOC0MTRE0SP5ra99wTBqsUZp+5eybdUOCy7/SfG/jEe2QuHlVfWmrlmQ9R/OPTuIuH+KiSOu6YOFqUSD1mBaz6BxHGPh0mLP5ir8fk=;
X-UUID: f3718e36bf9343899e3e7ffec82eec9b-20210803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 182763498; Tue, 03 Aug 2021 03:40:13 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 03:40:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 18:40:10 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 18:40:09 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, "Mason
 Zhang" <Mason.Zhang@mediatek.com>
Subject: [PATCH v2 1/4] spi: move cs spi_delay to spi_device
Date: Tue, 3 Aug 2021 18:23:34 +0800
Message-ID: <20210803102333.22568-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_034017_070288_13ED1B2D 
X-CRM114-Status: GOOD (  16.71  )
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
