Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8288ECA9EB6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 12:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5075F2173B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 12:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ERPx3TiJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5075F2173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqQxz0CdcY5lkH3ijvsSVFRC0vPGeztfT7RhknA3AYU=; b=ERPx3TiJMfkjeD
	NV/ZsgNCe2LvQ+3ee4ej2l5+0MGM3G/hA1ReCXZGi4n6e8ZzaSFMdrCrpQgucIGs6RGvvGFblEybb
	6VbxcdIQ9OlPcAQVVGouU04WCtX42yp50ICdqqeGWaryPZY+8YDs8cA7+0NiSzx02mtIoe5Zooe7j
	CsAdEzn6M9p+b1QUxksHsn5f02S1njfvxZTq2TsbtL2s+D+KQeNoVghMMVX3H6z1ztVYcYBnVbizB
	Ey1BOkD01DsUDyofOzDoNFCesmyZBdt6eFMTHRgKNafyNwuvGTQBGhsQmpGinQy8jahD/BjQXoy9K
	yVqDTSwAyctEEPgJPgVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNFy4-0007cR-TE; Wed, 23 Oct 2019 12:42:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNFy2-0007ar-9j; Wed, 23 Oct 2019 12:42:23 +0000
X-UUID: cfea1dc5a79d4532966154082742f831-20191023
X-UUID: cfea1dc5a79d4532966154082742f831-20191023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <luhua.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1619795605; Wed, 23 Oct 2019 04:41:48 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 23 Oct 2019 05:42:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 23 Oct 2019 20:42:11 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 23 Oct 2019 20:42:11 +0800
From: Luhua Xu <luhua.xu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/1] spi: mediatek: add power control when set_cs
Date: Wed, 23 Oct 2019 08:38:42 -0400
Message-ID: <1571834322-1121-2-git-send-email-luhua.xu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1571834322-1121-1-git-send-email-luhua.xu@mediatek.com>
References: <1571834322-1121-1-git-send-email-luhua.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_054222_338296_2DD6C3E7 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, luhua.xu@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "luhua.xu" <luhua.xu@mediatek.com>

Use runtime PM to power spi when set_cs
As set_cs may be called from interrupt context,
set runtime PM IRQ safe for spi.

Signed-off-by: luhua.xu <luhua.xu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 6888a4d..039b67d 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -262,8 +262,16 @@ static int mtk_spi_prepare_message(struct spi_master *master,
 static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 {
 	u32 reg_val;
+	int ret;
 	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
 
+	ret = pm_runtime_get_sync(spi->master->dev.parent);
+	if (ret < 0) {
+		pm_runtime_put_noidle(spi->master->dev.parent);
+		dev_err(&spi->dev, "failed to power device(%d)\n", ret);
+		return;
+	}
+
 	reg_val = readl(mdata->base + SPI_CMD_REG);
 	if (!enable) {
 		reg_val |= SPI_CMD_PAUSE_EN;
@@ -274,6 +282,9 @@ static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 		mdata->state = MTK_SPI_IDLE;
 		mtk_spi_reset(mdata);
 	}
+
+	pm_runtime_mark_last_busy(spi->master->dev.parent);
+	pm_runtime_put_autosuspend(spi->master->dev.parent);
 }
 
 static void mtk_spi_prepare_transfer(struct spi_master *master,
@@ -749,6 +760,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	clk_disable_unprepare(mdata->spi_clk);
 
 	pm_runtime_enable(&pdev->dev);
+	pm_runtime_irq_safe(&pdev->dev);
 
 	ret = devm_spi_register_master(&pdev->dev, master);
 	if (ret) {
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
