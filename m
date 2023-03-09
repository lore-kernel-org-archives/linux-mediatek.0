Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D33C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhKeH3rHgwIz78r23ddrmontTDsOzJZlpU1B9AnE7cM=; b=ImRMhGr79mUPgvqST8POvbZeQ4
	Fmiaj5tvM0ZsilfqeUmTAdMrUOnjWEIrLZTtIqe3QXesRyBhCWDeZ1BAblhFhM+oJ366qbYxEJXD4
	fyncsoA1zSrugS+BBVYNUO7pNYHheoDPcrsGyCs8J85thK80BpYdpf22QH3v2kM4u8ukah5f89kVE
	3o+11RDtgu70HSoVgG37EBvNkXiKHtU99UBRqhZWSZUKKxMZNazGzfZEK+l2k8bFFB4CnJN7tGXrc
	9tnvTuOCPlHxT9ccpHqChEjKFDxMXLhP03QoDwmILHbOEiHgG/Znfh5fSqkFxZdKvCBoD5AWejJhR
	rNlB21Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCuH-008v0x-Rl; Thu, 09 Mar 2023 09:49:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCuG-008uyi-7f
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 09:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fhKeH3rHgwIz78r23ddrmontTDsOzJZlpU1B9AnE7cM=; b=QR98UB57g3mqDEED7CrWHJ2auh
	8PMuUWIA79jsLpxEHAlRDKjL33QBzkq9owlSjCY12aIt4mrB05lEDs8Hv8zr/rGf/1bW9lY54pj9y
	OyPOJlQgXpQegNp5YNNF7Fdz0u014VKdKO/cE82GnBmDl3claFztmlI1WUr9iqSC3FRxDRKAePPav
	UlYSYxTk0IPjJgO8Z8+Rxop3n9gMGg9tB3NFEeuKXqhLPqOKeTuEdPM1fsArHBCZPNHQtWyqOPeU+
	8DwkWhduUsGAySnO1DibY/mtrRcTIWRu8VMWw8KNBTFGaju7qLZSufivJHF7ZF3hY4D7DIl4FUhf/
	x95MI49w==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paCro-0004OE-06
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 09:49:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCrc-0007fz-K6; Thu, 09 Mar 2023 10:47:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCrb-002uvD-FU; Thu, 09 Mar 2023 10:47:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCra-003VnK-Ib; Thu, 09 Mar 2023 10:47:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] spi: mt65xx: Convert to platform remove callback returning void
Date: Thu,  9 Mar 2023 10:47:03 +0100
Message-Id: <20230309094704.2568531-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
References: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7aQRHUM0nn1KAYfowSFFpPqyE6Rm7GehZyTUDdqE1Xc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCasRGa1M9enMj+FEqlm29VBuy0k2ifJO+7LBD JQCUASuF3yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAmrEQAKCRDB/BR4rcrs CWCRB/4neYZ2scIoMfbnFUOUFFF6gQT3ptgdHe/Ft6Nw7PO3EHjj4UPwDPl8qtgwNbZoyDkzDOF jMl3pt7T2BnmN/Ujs+zLh+sfPf21JXCHDPsJJvUJwJx30N/+wm/E0dp99KdxxHqwECInATXoDlx zdc6jDftU0dpLms93A39YGlcfWCnNWPnV6XnDN49naqHTXNn35YOFaYEAgINU2q400b3tlqWewM bvGt1DIo5XFRl3SLsIxhSuVjfcWPLDMdJJ0Yb4h+5zQtebTpr3bpAFYG+e6J3OAeglkm4tjIzhe IAdPGMYtjJJbdRm37bgwghN+/a9YzcYXy6YxMCQ0/y+z/NP9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_094924_221975_51B873F6 
X-CRM114-Status: GOOD (  15.54  )
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
 drivers/spi/spi-mt65xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index b1cf7bbb2c08..f744cb97aa87 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1269,7 +1269,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_spi_remove(struct platform_device *pdev)
+static void mtk_spi_remove(struct platform_device *pdev)
 {
 	struct spi_master *master = platform_get_drvdata(pdev);
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
@@ -1293,8 +1293,6 @@ static int mtk_spi_remove(struct platform_device *pdev)
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1414,7 +1412,7 @@ static struct platform_driver mtk_spi_driver = {
 		.of_match_table = mtk_spi_of_match,
 	},
 	.probe = mtk_spi_probe,
-	.remove = mtk_spi_remove,
+	.remove_new = mtk_spi_remove,
 };
 
 module_platform_driver(mtk_spi_driver);
-- 
2.39.1


