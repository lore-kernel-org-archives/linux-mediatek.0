Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56063C43466
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 21:41:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1422207FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 21:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tBbFcteq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+qqjX2+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1422207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YX7xskmdy0g7z6PhFL0ofQk9JdMkN7IPToXRJqsA5tY=; b=tBbFcteqOVaoHY78A1KdA946f
	EB/zDTCKqBtwzp9EURoKlxu/L3bmPfIR9u162C3bMepB7PtAxUL+YdydOLICNTg6NSApBk1QNPZHY
	RZ+eNqqKvm4AAeCGMdqG/O0+jH8bV7MfWV1Lb8S0YCtJP+mZcJ4UDxBOhT/Bz1ll9Ick0tEA8e6Oh
	FXGSsJUpfwq5VGf1gDeSqqoLOaFiA6V1UGi+aAm32qeeYlJUM+lab0JUDGcSVMn934H1B2L7eN+TT
	e7hv5ETlY77h7Sx6cbzySA+mCsUP3DJvUkbwiJjkU3mUYUvOZ8OuKYiXPFhFTC1Xb6wyjSy2JOp7t
	QpHkApf2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxdWi-0003L1-Gi; Mon, 20 Jul 2020 21:40:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxdUz-0002Ks-1t; Mon, 20 Jul 2020 21:39:02 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7609322CAF;
 Mon, 20 Jul 2020 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595281140;
 bh=5UrXs5K40IkwuyX6XDwLrEXO6fTXoOdDk5vlpHZthbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+qqjX2+2B8nr9SL3tj+uWAfmi3EyqylZIzGlvIRwV8EF8N0wE6fHGJ0jhxgL4rOE
 GH5A7TtbmbDV7F3oCSn1caDZWbb09LpuNyAznY2C6Uu6uCT6SB+0ITVRMoRmNuoAc8
 DF1hYXWX3MKv1ny5ZLZBnICCpiG4ZLv+4P3JELYY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 07/19] spi: mediatek: use correct SPI_CFG2_REG
 MACRO
Date: Mon, 20 Jul 2020 17:38:38 -0400
Message-Id: <20200720213851.407715-7-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213851.407715-1-sashal@kernel.org>
References: <20200720213851.407715-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_173901_838948_97008CC3 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: Sasha Levin <sashal@kernel.org>, "leilk.liu" <leilk.liu@mediatek.com>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "leilk.liu" <leilk.liu@mediatek.com>

[ Upstream commit 44b37eb79e16a56cb30ba55b2da452396b941e7a ]

this patch use correct SPI_CFG2_REG offset.

Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
Link: https://lore.kernel.org/r/20200701090020.7935-1-leilk.liu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-mt65xx.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 0c2867deb36fc..da28c52c9da19 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -41,7 +41,6 @@
 #define SPI_CFG0_SCK_LOW_OFFSET           8
 #define SPI_CFG0_CS_HOLD_OFFSET           16
 #define SPI_CFG0_CS_SETUP_OFFSET          24
-#define SPI_ADJUST_CFG0_SCK_LOW_OFFSET    16
 #define SPI_ADJUST_CFG0_CS_HOLD_OFFSET    0
 #define SPI_ADJUST_CFG0_CS_SETUP_OFFSET   16
 
@@ -53,6 +52,8 @@
 #define SPI_CFG1_CS_IDLE_MASK             0xff
 #define SPI_CFG1_PACKET_LOOP_MASK         0xff00
 #define SPI_CFG1_PACKET_LENGTH_MASK       0x3ff0000
+#define SPI_CFG2_SCK_HIGH_OFFSET          0
+#define SPI_CFG2_SCK_LOW_OFFSET           16
 
 #define SPI_CMD_ACT                  BIT(0)
 #define SPI_CMD_RESUME               BIT(1)
@@ -259,7 +260,7 @@ static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 static void mtk_spi_prepare_transfer(struct spi_master *master,
 				     struct spi_transfer *xfer)
 {
-	u32 spi_clk_hz, div, sck_time, cs_time, reg_val = 0;
+	u32 spi_clk_hz, div, sck_time, cs_time, reg_val;
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 
 	spi_clk_hz = clk_get_rate(mdata->spi_clk);
@@ -272,18 +273,18 @@ static void mtk_spi_prepare_transfer(struct spi_master *master,
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
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
