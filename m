Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6DDC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:06:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F723207CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRR3lji7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tsodH8h0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F723207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WSTuKc4r8sepMe43y4hOwSeHpVksfRKQcvZxThViMac=; b=CRR3lji7t7MFpYSlsAsUVybWMJ
	7GNsyfNStr/mPR/2BBeBwU4sEfTIhzSVt5q5l/wSTiEvCyVGulSG8A9wNIfTjURDW0CgCR1oqaV32
	iGC0GJBbrfPBUMX82wbu5lk9D1o8NNo3EaCxRQuNuPjLrSDEgFQQWNuCsQyNpm2eZNi4hRstFG04V
	tH7ccZjRQMq7UdOsIP/3IAxXLSTTc5q5M2oqdoLigxlkK5Z5n+qSJB5DLjjAYBitNDZvfReVYBCvS
	oSW8XZ+2gxdmovFLQPBI/7Sk9yXPmPizHeFQySj8frqbRwVFRvO+QCXJ86CwBIsmgG3+nb8upNpog
	viR7a6wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYhS-00009A-D4; Wed, 01 Jul 2020 09:06:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYby-0005RH-6z; Wed, 01 Jul 2020 09:01:00 +0000
X-UUID: a382774df6724e9ca385bfb0802ae25f-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Qv6XrSDt4+UcCEb8Yjgdiw5IPmrQFZSbBF425Jx49SU=; 
 b=tsodH8h0xlzjZeGSrZhWB427epLji3z3fhDI7L6daw6+eeSYP8EizM85AOhEvTsYLY7/GzOqJhs0gP+aoM9Zx6GguIhK17xTgrghGm/vVdkVU5TUf5+AqMm0oQuPW0bkftFxZ/90AgZz4SKb3m5YH7LFudpSLw7j1P5pGyrEr9c=;
X-UUID: a382774df6724e9ca385bfb0802ae25f-20200701
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1004429681; Wed, 01 Jul 2020 01:00:49 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 02:00:48 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 17:00:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 17:00:44 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi: mediatek: use correct SPI_CFG2_REG MACRO
Date: Wed, 1 Jul 2020 17:00:20 +0800
Message-ID: <20200701090020.7935-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1D8602F4B699D685436BDB0F9B98B1E5A6A31780EC8839F2C9FBD58E6B8E5EB52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_050058_500520_1BCB7F3E 
X-CRM114-Status: GOOD (  11.43  )
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
 "leilk.liu" <leilk.liu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "leilk.liu" <leilk.liu@mediatek.com>

this patch use correct SPI_CFG2_REG offset.

Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 6783e12c40c2..a556795caeef 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -36,7 +36,6 @@
 #define SPI_CFG0_SCK_LOW_OFFSET           8
 #define SPI_CFG0_CS_HOLD_OFFSET           16
 #define SPI_CFG0_CS_SETUP_OFFSET          24
-#define SPI_ADJUST_CFG0_SCK_LOW_OFFSET    16
 #define SPI_ADJUST_CFG0_CS_HOLD_OFFSET    0
 #define SPI_ADJUST_CFG0_CS_SETUP_OFFSET   16
 
@@ -48,6 +47,8 @@
 #define SPI_CFG1_CS_IDLE_MASK             0xff
 #define SPI_CFG1_PACKET_LOOP_MASK         0xff00
 #define SPI_CFG1_PACKET_LENGTH_MASK       0x3ff0000
+#define SPI_CFG2_SCK_HIGH_OFFSET          0
+#define SPI_CFG2_SCK_LOW_OFFSET           16
 
 #define SPI_CMD_ACT                  BIT(0)
 #define SPI_CMD_RESUME               BIT(1)
@@ -283,7 +284,7 @@ static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 static void mtk_spi_prepare_transfer(struct spi_master *master,
 				     struct spi_transfer *xfer)
 {
-	u32 spi_clk_hz, div, sck_time, cs_time, reg_val = 0;
+	u32 spi_clk_hz, div, sck_time, cs_time, reg_val;
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 
 	spi_clk_hz = clk_get_rate(mdata->spi_clk);
@@ -296,18 +297,18 @@ static void mtk_spi_prepare_transfer(struct spi_master *master,
 	cs_time = sck_time * 2;
 
 	if (mdata->dev_comp->enhance_timing) {
+		reg_val = (((sck_time - 1) & 0xffff)
+			   << SPI_CFG2_SCK_HIGH_OFFSET);
 		reg_val |= (((sck_time - 1) & 0xffff)
-			   << SPI_CFG0_SCK_HIGH_OFFSET);
-		reg_val |= (((sck_time - 1) & 0xffff)
-			   << SPI_ADJUST_CFG0_SCK_LOW_OFFSET);
+			   << SPI_CFG2_SCK_LOW_OFFSET);
 		writel(reg_val, mdata->base + SPI_CFG2_REG);
-		reg_val |= (((cs_time - 1) & 0xffff)
+		reg_val = (((cs_time - 1) & 0xffff)
 			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
 		reg_val |= (((cs_time - 1) & 0xffff)
 			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
 		writel(reg_val, mdata->base + SPI_CFG0_REG);
 	} else {
-		reg_val |= (((sck_time - 1) & 0xff)
+		reg_val = (((sck_time - 1) & 0xff)
 			   << SPI_CFG0_SCK_HIGH_OFFSET);
 		reg_val |= (((sck_time - 1) & 0xff) << SPI_CFG0_SCK_LOW_OFFSET);
 		reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
