Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DCBC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 06:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D4F761019
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 06:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D4F761019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hkqMDosdCevLB8U1DI+3E+iltVLb7cIfED4XImISqGY=; b=VfDWu0OwWD4KLC
	VpZe5pqvEhsdLxUfJWxlvMwTbb9tC1Th40JV4Ka4AsjLhj+ZcIvlWEiuA8eE5tMov/2HIitBOY9Gm
	qldKlXTAJtd4dju6mvYzdOeSsTSqvGx2903U6lSBJNXCkHJtJqIEFs5e157ClsO4Xan6SAsnMHJZ+
	sv8f6Sr7vhmZcFl2zz3rX5wpUdQF8c3sJqZ38TcZFGYq5/rewzO36cMI9tfkuqJ/yutAluPXpOaBE
	biOgr2k2IxubA1WZOzueMx0A0Gzpn/3pvV/2xMhPFex3Qf83a6NqjGpLbowMGKPZW1ii8klqoe7mp
	f8TSxM7e4lB601RtfheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCyQX-00HEFD-AX; Mon, 09 Aug 2021 06:06:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCyQK-00HEE8-61; Mon, 09 Aug 2021 06:06:09 +0000
X-UUID: df1c662510f04b0b8640357377025bd2-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qMXnJqyXQtjIP7+qtB94E0Z9yykJ+3oSh6ELnH7hw2w=; 
 b=jQLnX58T8r2/yMsZBMLk3aH+tC1hMr454gOBungA9BfseVjU1aBNl9ZXDESAGLewx6BJ8H7C5vgSmRoQuOh3f7MZTFhO5ITAWiDI52/ZJQAiSG55ntygJg+NXFq/xVKJHD4xZgEgpldVcWvyXkVuNr8ZQV4xIFqXt3wtqgPwBMk=;
X-UUID: df1c662510f04b0b8640357377025bd2-20210808
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1225683945; Sun, 08 Aug 2021 23:06:04 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 23:01:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 14:01:32 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Aug 2021 14:01:31 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, Mason Zhang <Mason.Zhang@mediatek.com>
Subject: [PATCH 1/1] spi: mediatek: fix build warnning in set cs timing
Date: Mon, 9 Aug 2021 13:59:12 +0800
Message-ID: <20210809055911.17538-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_230608_273631_43405753 
X-CRM114-Status: GOOD (  11.25  )
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

this patch fixed the build warnning in set cs timing.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index bb09592bc009..2f83599642fd 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -214,7 +214,7 @@ static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
 	struct spi_delay *cs_setup = &spi->cs_setup;
 	struct spi_delay *cs_hold = &spi->cs_hold;
 	struct spi_delay *cs_inactive = &spi->cs_inactive;
-	u16 setup, hold, inactive;
+	u32 setup, hold, inactive;
 	u32 reg_val;
 	int delay;
 
@@ -239,8 +239,8 @@ static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
 
 	reg_val = readl(mdata->base + SPI_CFG0_REG);
 	if (mdata->dev_comp->enhance_timing) {
-		hold = min(hold, 0xffff);
-		setup = min(setup, 0xffff);
+		hold = min_t(u32, hold, 0x10000);
+		setup = min_t(u32, setup, 0x10000);
 		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
 		reg_val |= (((hold - 1) & 0xffff)
 			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
@@ -248,8 +248,8 @@ static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
 		reg_val |= (((setup - 1) & 0xffff)
 			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
 	} else {
-		hold = min(hold, 0xff);
-		setup = min(setup, 0xff);
+		hold = min_t(u32, hold, 0x100);
+		setup = min_t(u32, setup, 0x100);
 		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
 		reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
 		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
@@ -258,7 +258,7 @@ static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
 	}
 	writel(reg_val, mdata->base + SPI_CFG0_REG);
 
-	inactive = min(inactive, 0xff);
+	inactive = min_t(u32, inactive, 0x100);
 	reg_val = readl(mdata->base + SPI_CFG1_REG);
 	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
 	reg_val |= (((inactive - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
