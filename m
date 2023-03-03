Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B7BC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss961LJ91eQPj74XtoW1LOVsYbns5ydroiBUQZvygXo=; b=zYJ2RraTE5HLKhX8TB6zpLgvIN
	HQyRtp1ACIrFkcN9B6XpNhGzLieIowc8YC9qEcwqIj12z5j58kuDMWacfz//Zl8ua5PrVSi/iG74Y
	eyMUU8TR3iLvfRfMXdWb6qBSeRDgRilSIY2uvLztmHgXEdji/PK89QBDmrjTfIlo2Ub8gHKhityFy
	V4k6hheENo7e3nYxZh/RMPHxQ8pE+Bog36Y/kKdaBk3hfxTstuuJJhia3uZWxVPXU49brY/u7SXix
	Gu+rOZVK+raQ4jgZoiQQu+h8kqts15bwOGC3oqSs5NN8Z/KZV9XTdQC8MuYmukBtB7EuXLyyH+AXS
	av2pwprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY979-006tnu-28; Fri, 03 Mar 2023 17:22:39 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95i-006t5x-Ah
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 17:21:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95Z-0006nb-Qj; Fri, 03 Mar 2023 18:21:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95Y-001blp-9d; Fri, 03 Mar 2023 18:21:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95X-001tkY-HF; Fri, 03 Mar 2023 18:20:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 42/87] spi: mtk-snfi: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:19:56 +0100
Message-Id: <20230303172041.2103336-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9HCn3Ajliympt2j/eU2WMSCODvoPrwHImFJwAQQQGEs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiutIIF62FsinJ91ws4cCd2Axf2iGC0uQTKGA tz+Ro4YmpWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIrrQAKCRDB/BR4rcrs CR5DB/0V3dZa5NSV2GdMJ4CQbiDuthvzPmYj5YbDHCJ+5AZQ3Ed0ksIbS+YZSctXub/tnUOPdxs oarTsboXFESau7Q/7FvtwLK24EZmCzL9Rq9nfk9e5NltsN6bUg7y8pnzc6iREDh70GZ4ZvlnH4J gQCLHkMkuPH7R2TJevI/1lCS8GEkQ5vRfLYB5ffjCwqTNZOVDV40S8rrS7f+eQsPaI51fkWtHhz Tw7G/XWlwWY63oUmu2E9g+sLh0aAvqC4zpVbAYSv3+4ZTTeQ0i++r6Q2J5LOyKoR9Mxi3+UgmeG 8C4Kn8OG31oj4tN+dj5t5g3ylcdro0STjz3yDe36P4DFdoqh
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092110_434330_80C72239 
X-CRM114-Status: GOOD (  15.96  )
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
 drivers/spi/spi-mtk-snfi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index f3f95eb37365..bed8317cd205 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1506,7 +1506,7 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_snand_remove(struct platform_device *pdev)
+static void mtk_snand_remove(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr = platform_get_drvdata(pdev);
 	struct mtk_snand *ms = spi_controller_get_devdata(ctlr);
@@ -1515,12 +1515,11 @@ static int mtk_snand_remove(struct platform_device *pdev)
 	mtk_snand_disable_clk(ms);
 	mtk_ecc_release(ms->ecc);
 	kfree(ms->buf);
-	return 0;
 }
 
 static struct platform_driver mtk_snand_driver = {
 	.probe = mtk_snand_probe,
-	.remove = mtk_snand_remove,
+	.remove_new = mtk_snand_remove,
 	.driver = {
 		.name = "mtk-snand",
 		.of_match_table = mtk_snand_ids,
-- 
2.39.1


