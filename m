Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF0AC07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 11:58:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D9F61166
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 11:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16D9F61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tyW+9pdjUqTEXfduEf8iNzJTeidi4/dK9jACrZXxYsM=; b=4wwkREF5MO0u6H
	VUKVDIsP3OTF9nB66Q4wf4dx2SBUE/sfmLwo+L891z0hDwt5Y28IlyHIq9W0De+QbzloU3Ci9ddzy
	btS/mIq7/a5naFiV68hPrIs6HptfH0z+OEA7t6hfOQ2pzUerL7QRcqcLKOi+ztIoPZpqtvvtqyUlc
	y9MErNTdihpa1cKgPz7rcoi1/kQ8d/qQhfKLlnl4gf23yAM2+9O5GzkZbtyFbN47VgVBy7m5uUJes
	5fwpI7E4Ut/MAUvG0Pm1MmebY/Rlmlmv1FXuRGexyvwd303gaQlbDGJvqaSYzb+qap2fG22EEPy7l
	aqWmkGsyNnAEThly/SeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3H3O-00AHyo-Q3; Tue, 13 Jul 2021 11:58:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3H3A-00AHwf-4h; Tue, 13 Jul 2021 11:58:11 +0000
X-UUID: 3b8de30d28104fc095e41b89383fe4fb-20210713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YQqkdY8ls8dBGB1GjB65nBeN3TNCQVKWRZ9qwuwHYdo=; 
 b=n94eEHTiLlD05ADYZGrWpr3VECSMliopPu0QYdWqHQ0CGwS1ot9+/hUFXpw0DkemVPiLF+MOLsD9ESZMOcZio5fIwwKatMawatKBdDBQXEcuBUzi80Arw0Hc5GjwYS98QyGlvL6sG0PG+yklW87yDLu90uA7fPRv8casD3eFg8c=;
X-UUID: 3b8de30d28104fc095e41b89383fe4fb-20210713
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 288985213; Tue, 13 Jul 2021 04:58:02 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 04:58:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 19:57:52 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Jul 2021 19:57:52 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <leilk.liu@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Subject: [PATCH 1/2] spi: mediatek: add tick_delay support
Date: Tue, 13 Jul 2021 19:40:49 +0800
Message-ID: <20210713114048.29509-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_045809_649730_6613F917 
X-CRM114-Status: GOOD (  13.75  )
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

This patch support tick_delay setting, some users need use
high-speed spi speed, which can use tick_delay to tuning spi clk timing.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/spi/spi-mt65xx.c                 | 11 ++++++++++-
 include/linux/platform_data/spi-mt65xx.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 097625d7915e..b34fbc913fd6 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -42,8 +42,9 @@
 #define SPI_CFG1_CS_IDLE_OFFSET           0
 #define SPI_CFG1_PACKET_LOOP_OFFSET       8
 #define SPI_CFG1_PACKET_LENGTH_OFFSET     16
-#define SPI_CFG1_GET_TICK_DLY_OFFSET      30
+#define SPI_CFG1_GET_TICK_DLY_OFFSET      29
 
+#define SPI_CFG1_GET_TICK_DLY_MASK        0xe0000000
 #define SPI_CFG1_CS_IDLE_MASK             0xff
 #define SPI_CFG1_PACKET_LOOP_MASK         0xff00
 #define SPI_CFG1_PACKET_LENGTH_MASK       0x3ff0000
@@ -152,6 +153,7 @@ static const struct mtk_spi_compatible mt6893_compat = {
  */
 static const struct mtk_chip_config mtk_default_chip_info = {
 	.sample_sel = 0,
+	.tick_delay = 0,
 };
 
 static const struct of_device_id mtk_spi_of_match[] = {
@@ -275,6 +277,13 @@ static int mtk_spi_prepare_message(struct spi_master *master,
 		writel(mdata->pad_sel[spi->chip_select],
 		       mdata->base + SPI_PAD_SEL_REG);
 
+	/* tick delay */
+	reg_val = readl(mdata->base + SPI_CFG1_REG);
+	reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
+	reg_val |= ((chip_config->tick_delay & 0x7)
+		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
+	writel(reg_val, mdata->base + SPI_CFG1_REG);
+
 	return 0;
 }
 
diff --git a/include/linux/platform_data/spi-mt65xx.h b/include/linux/platform_data/spi-mt65xx.h
index 65fd5ffd257c..f0db674f07b8 100644
--- a/include/linux/platform_data/spi-mt65xx.h
+++ b/include/linux/platform_data/spi-mt65xx.h
@@ -12,5 +12,6 @@
 /* Board specific platform_data */
 struct mtk_chip_config {
 	u32 sample_sel;
+	u32 tick_delay;
 };
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
