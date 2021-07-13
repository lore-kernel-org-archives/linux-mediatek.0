Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AD7C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 11:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C391610C7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 11:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C391610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a3LGo25MCoI2msm0DckX3jPhJcbfWeA36mKv+EJHlzg=; b=4vvspJ89eVfqCK
	6syDCYLyNVltZCZSmKHeMCz1GcHJg8UqE2Iv2FgUfy1l2gGaWRWVz/KweWk4JBHNeVPgGg+XynmQs
	XUFQWPgIWvFIpThosU0i4urkjVZHfVSsfPx7ziYbxi7ApcLvaEOcyxeo5cCyvuRHpCbs1Y4HJ9Z9A
	cW063ruKINL+RaRNwMiI26gMLlIdVdhCC1P4GxU4z4LWg8emSMcXjAT/vpnZPoYnDjBmh5MPjNMbR
	x1MO5S/f0kVAfbx8I7v/C2Mc8kWpSa7z2rXGR2Iqjl/88ayD8wlY+je+qK+RyAxLsJIylOOVck/ci
	6TXxV8coyUDtMBRo2ZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3H4i-00AICX-7U; Tue, 13 Jul 2021 11:59:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3H4V-00AI9b-I8; Tue, 13 Jul 2021 11:59:32 +0000
X-UUID: 40a2611de0824863b142acaaf0c4fd77-20210713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SPZ2r0CpP8HHfS92pWXoteNBdScrZURLzlNkxEe1KLs=; 
 b=BaHo7BF7WtCRlFxxL4JWKIhXsPh8vTTXZ4UrPgu8vtByHrsXYHWBP1NPTWOhvOxz7+TUwaE1+PmrNKAErWsOcqLyvhAhFldGDr119GUHmunlrRF1x3oHzU2AVyyGENoBbBGgJNK1DWSXwM+btosMa//XVw9T1tlwEjYJ+BuoDE4=;
X-UUID: 40a2611de0824863b142acaaf0c4fd77-20210713
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1626708876; Tue, 13 Jul 2021 04:59:25 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 04:59:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 19:59:22 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Jul 2021 19:59:21 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <leilk.liu@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Subject: [PATCH 2/2] spi: mediatek: move devm_spi_register_master position
Date: Tue, 13 Jul 2021 19:42:48 +0800
Message-ID: <20210713114247.1536-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_045931_649520_1750537D 
X-CRM114-Status: GOOD (  12.76  )
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

This patch move devm_spi_register_master to the end of mtk_spi_probe.
If slaves call spi_sync in there probe function, master should have probe done.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index b34fbc913fd6..6f2925118b98 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -820,12 +820,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	ret = devm_spi_register_master(&pdev->dev, master);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register master (%d)\n", ret);
-		goto err_disable_runtime_pm;
-	}
-
 	if (mdata->dev_comp->need_pad_sel) {
 		if (mdata->pad_num != master->num_chipselect) {
 			dev_err(&pdev->dev,
@@ -865,6 +859,12 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		dev_notice(&pdev->dev, "SPI dma_set_mask(%d) failed, ret:%d\n",
 			   addr_bits, ret);
 
+	ret = devm_spi_register_master(&pdev->dev, master);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register master (%d)\n", ret);
+		goto err_disable_runtime_pm;
+	}
+
 	return 0;
 
 err_disable_runtime_pm:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
