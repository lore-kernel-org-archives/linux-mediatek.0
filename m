Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390B8C11F66
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 10:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F37E661DC9
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 10:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F37E661DC9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aTWvCoDS7Qq5HkmF93OTz00Ih2RnDnMtI6JB0xFrRbA=; b=Gd1mHvdBTE9S1p
	uNJiWZPLL5+Pie4dT8pLcntjz/JcyUJ42uXZX0Cho0KyoH+EhW6s01PijFjEP0BjZbz7GV6ibyHrI
	GaOalBc/j4BHYeHkQojbEgGmCbUi7jPJFs5AQqEunFKwkQgf/9Jv8/UcQfSQP4kn6di56DxPYRrxZ
	nqPkiFa2p4yWV2xkTVNzMnQBXxPt5bIeMygN/ur7qqn2UuFVUQFLdnC5QOq3mfxwxvWjwVa34KyIN
	D4wAqQIK5XtBufsMDehfCJKYzRTccVsVnuo5a24RhGYgEiT3jminF+SA9B9HZuAjzZ+tWu32xSRqH
	ZX9swjipkqEWUjWeea6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyAvN-00AUHE-HD; Tue, 29 Jun 2021 10:25:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyAv8-00AUDf-Bg; Tue, 29 Jun 2021 10:24:49 +0000
X-UUID: c5564a913df84e46923a17fe6b8632f3-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=li3oK4Envu9e6MTvV+9wDMHKWgBG6cz5ksis5g9FqNQ=; 
 b=LMhyeLNQjfocZWsJm/JFljSCA1+7q2CevtGZEIRFYNKuKAG3xKEDIcAO4XyprT05tf17275XCeQtBytByRG/BNs/Dt6QZvktv4b0lPINvDnr9V2huuJwO0S9XJVb22RiQMOjlgLyWJGeMsQudtqa+moID4ci7/2hdIEweuoLPeE=;
X-UUID: c5564a913df84e46923a17fe6b8632f3-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1397046168; Tue, 29 Jun 2021 03:24:42 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 03:24:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 18:24:21 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 18:24:20 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <leilk.liu@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Subject: [PATCH 1/2] spi: mediatek: add no_need_unprepare support
Date: Tue, 29 Jun 2021 18:08:15 +0800
Message-ID: <20210629100814.21402-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_032447_873771_1E05055A 
X-CRM114-Status: GOOD (  19.82  )
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

This patch add no_need_unprepare support for spi, if spi src clk is
MAIN PLL, it can keep the clk_prepare and will not cause low power
issue. So we no need do clk_prepare/clk_unprepare in runtime pm,
and it will get better performance, because clk_prepare has called
mutex lock.
In the same way,
clk_get_rate also has called mutex lock, so we moved it to spi_probe.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 41 +++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 976f73b9e299..097625d7915e 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -90,6 +90,8 @@ struct mtk_spi_compatible {
 	bool enhance_timing;
 	/* some IC support DMA addr extension */
 	bool dma_ext;
+	/* some IC no need unprepare SPI clk */
+	bool no_need_unprepare;
 };
 
 struct mtk_spi {
@@ -104,6 +106,7 @@ struct mtk_spi {
 	struct scatterlist *tx_sgl, *rx_sgl;
 	u32 tx_sgl_len, rx_sgl_len;
 	const struct mtk_spi_compatible *dev_comp;
+	u32 spi_clk_hz;
 };
 
 static const struct mtk_spi_compatible mtk_common_compat;
@@ -135,6 +138,14 @@ static const struct mtk_spi_compatible mt8183_compat = {
 	.enhance_timing = true,
 };
 
+static const struct mtk_spi_compatible mt6893_compat = {
+	.need_pad_sel = true,
+	.must_tx = true,
+	.enhance_timing = true,
+	.dma_ext = true,
+	.no_need_unprepare = true,
+};
+
 /*
  * A piece of default chip info unless the platform
  * supplies it.
@@ -174,6 +185,9 @@ static const struct of_device_id mtk_spi_of_match[] = {
 	{ .compatible = "mediatek,mt8192-spi",
 		.data = (void *)&mt6765_compat,
 	},
+	{ .compatible = "mediatek,mt6893-spi",
+		.data = (void *)&mt6893_compat,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_spi_of_match);
@@ -287,12 +301,11 @@ static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 static void mtk_spi_prepare_transfer(struct spi_master *master,
 				     struct spi_transfer *xfer)
 {
-	u32 spi_clk_hz, div, sck_time, reg_val;
+	u32 div, sck_time, reg_val;
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 
-	spi_clk_hz = clk_get_rate(mdata->spi_clk);
-	if (xfer->speed_hz < spi_clk_hz / 2)
-		div = DIV_ROUND_UP(spi_clk_hz, xfer->speed_hz);
+	if (xfer->speed_hz < mdata->spi_clk_hz / 2)
+		div = DIV_ROUND_UP(mdata->spi_clk_hz, xfer->speed_hz);
 	else
 		div = 1;
 
@@ -789,7 +802,12 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		goto err_put_master;
 	}
 
-	clk_disable_unprepare(mdata->spi_clk);
+	mdata->spi_clk_hz = clk_get_rate(mdata->spi_clk);
+
+	if (mdata->dev_comp->no_need_unprepare)
+		clk_disable(mdata->spi_clk);
+	else
+		clk_disable_unprepare(mdata->spi_clk);
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -857,6 +875,9 @@ static int mtk_spi_remove(struct platform_device *pdev)
 
 	mtk_spi_reset(mdata);
 
+	if (mdata->dev_comp->no_need_unprepare)
+		clk_unprepare(mdata->spi_clk);
+
 	return 0;
 }
 
@@ -905,7 +926,10 @@ static int mtk_spi_runtime_suspend(struct device *dev)
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 
-	clk_disable_unprepare(mdata->spi_clk);
+	if (mdata->dev_comp->no_need_unprepare)
+		clk_disable(mdata->spi_clk);
+	else
+		clk_disable_unprepare(mdata->spi_clk);
 
 	return 0;
 }
@@ -916,7 +940,10 @@ static int mtk_spi_runtime_resume(struct device *dev)
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 	int ret;
 
-	ret = clk_prepare_enable(mdata->spi_clk);
+	if (mdata->dev_comp->no_need_unprepare)
+		ret = clk_enable(mdata->spi_clk);
+	else
+		ret = clk_prepare_enable(mdata->spi_clk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
 		return ret;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
