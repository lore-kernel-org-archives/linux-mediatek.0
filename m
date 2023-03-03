Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C109C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TM/+kapddSggzJw8hdYpt8/CY3xGRqArc4isdmMyvm0=; b=f79fK8xB6ffaH/ArR1KVwGnC3j
	lo46rnAesZ+rr1Rh5I2THTSTAup4fJ8kMfQmACqq0JMBgg02A85eUFW4HXhYmjv5dcy0P3AH13W6V
	nZrQ+sceoPHjJYDcAZDqgQNiNQbXDUaVK9qvWMb6OnZF8MBzWNAFQz7E6HJd8az7yHeygmKEHEkb6
	Dml2+/7vhRKYgj28Pr/se2P2IXYuqa1Nnalz1hjwujevzsgC5F/ddYosCdPTRazPozh9ooyeDSuQO
	0KZ07RfAFervQYbAQxzW7KgWufsYNOoylZBnlQdHQmi7VaT+eJvJXK6sr0iDsN3BUMZzOa3Ew0esd
	PUErg82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY995-006v1i-DM; Fri, 03 Mar 2023 17:24:39 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95m-006t8b-V6
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 17:21:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95Z-0006nq-Qi; Fri, 03 Mar 2023 18:21:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95Y-001blt-Cq; Fri, 03 Mar 2023 18:21:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95X-001tkT-AM; Fri, 03 Mar 2023 18:20:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 41/87] spi: mtk-nor: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:19:55 +0100
Message-Id: <20230303172041.2103336-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YZYhH+wuvs1yYmUmSGIJe1W+P1/Fri/WOjTpGI34ElM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiupKQNMjbnswBSeJd1I84BeHV7rB5Noc5m68 GhA8k0H+FeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIrqQAKCRDB/BR4rcrs CVADCACfRpSzUpZqrmQMl4KXCaHZDRHLfm5L68s6StP6Shr8+PneTyv+iNboi5iZz6YPbwlOhCv 7lWzDA7TKrjYPJ6wvc6FbKeVQQKEdPfo8IZugHaQUke3R2bYHMqe7Y5SBRDJk83IVTLEsi5nETM pxgxf8fdLKzej5Ub7RHLyOKCgV2c1T4OooUmkM+ly7bJjgPymsAQ0zZvypKt3y2aMItdwdcLuOH DIJDp8UZ3CsczLSEI/ZEVJLrtas66ATKg9iS+HIltUZ1QTgQPBWjRuW52v/4FoJ/1XVEe6ms60l 1H/9Ar9goKS+RKkQMAqg5sIfZJh9xSoRWlRz4GaSySt5CvKG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092115_027850_62DDDFE4 
X-CRM114-Status: GOOD (  15.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/spi/spi-mtk-nor.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index aad92a58c4b8..baa7a5353987 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -934,7 +934,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_nor_remove(struct platform_device *pdev)
+static void mtk_nor_remove(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr = dev_get_drvdata(&pdev->dev);
 	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
@@ -944,8 +944,6 @@ static int mtk_nor_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	mtk_nor_disable_clk(sp);
-
-	return 0;
 }
 
 static int __maybe_unused mtk_nor_runtime_suspend(struct device *dev)
@@ -999,7 +997,7 @@ static struct platform_driver mtk_nor_driver = {
 		.pm = &mtk_nor_pm_ops,
 	},
 	.probe = mtk_nor_probe,
-	.remove = mtk_nor_remove,
+	.remove_new = mtk_nor_remove,
 };
 
 module_platform_driver(mtk_nor_driver);
-- 
2.39.1


