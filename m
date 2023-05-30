Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D57BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jya8VrusGwl6Cqm7tBgL+1NUaVoQ8aOU+O8WfUiaJpI=; b=mMWKMMQ3z36fEk3IuCuG9xqzSv
	uoQE7fg5m5ZvL625zZ8tofbQkwjQaUbDa+4zlyRm1s6PtngVAQ76InbMGDZ7+bCs1wRvbvVCLI58y
	UexdULbQlz2AY/zxoWq1CZiJVRM1J0zmpx04Sil5XnwKPIocB8zaeQ9AttiIQ145r9cJ8ZA1RJ+SL
	toTdK/fYfsKeLxJ4OKy0rRx0zRoa71FIVwvLwIgvjYkvMHr6RmkBZ5uuR5tdhtSPr8Ih+U+L0jFV2
	GcsssiVpHNyqJRlgJL3Kj/ppTp6KkxU7TBF31yM/bfyTqLji8n3uy3c16HWUWaOTfhQBR3KcDt7K/
	0qwPnp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXQ-00CtGC-0A;
	Tue, 30 May 2023 08:17:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXJ-00CtCM-2u
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 08:16:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXF-0008MO-AW; Tue, 30 May 2023 10:16:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXE-003pUu-LD; Tue, 30 May 2023 10:16:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXD-009PLq-Pi; Tue, 30 May 2023 10:16:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/3] spi: mt65xx: Convert to platform remove callback returning void
Date: Tue, 30 May 2023 10:16:47 +0200
Message-Id: <20230530081648.2199419-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
References: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RMZEMdZ0GqYLZEELtvtNLR429tgOZGoJUI2pqpA2CY4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdbDuWdq8rXYgK7WodWwgE3y3t+cF8MaToAmwD 2WTnHYzJ5KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHWw7gAKCRCPgPtYfRL+ Tj2/B/9etgpKKQOLXjPFtJ6cKloOTN73b/RnWt0UCOtUBYlD2E5ynsgoDH3hgzE9bFivNFJ/5ne 8XjzQPJwkz1dlwbL59bevn+pzXd5aRvJX6MFG/wFV1quSojxk8noVGKZNG5sq2O6SDyUaVCLMOd IEVaZw+D4/tvnPjnH/9HYRu6Vf+vE1FqN57RvrxgKXOswVQ8Or/gEqbvAGyfmf1JOEUZV7QioeQ CCqa73xZsQN18K5UgSX6awi5YVM9LxC9CzI6DrppUT36aZtQvIW6I1yz2HTcmUurrSLOosoKlRn Pf5QU5mLJO68G6t4tQRWmZexCkpGhDGeAoaln/I2t5sMKXXx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_011657_938022_6D56AE27 
X-CRM114-Status: GOOD (  15.61  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/spi/spi-mt65xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 9333a0e8204d..f532cee3461e 100644
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
@@ -1294,8 +1294,6 @@ static int mtk_spi_remove(struct platform_device *pdev)
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1415,7 +1413,7 @@ static struct platform_driver mtk_spi_driver = {
 		.of_match_table = mtk_spi_of_match,
 	},
 	.probe = mtk_spi_probe,
-	.remove = mtk_spi_remove,
+	.remove_new = mtk_spi_remove,
 };
 
 module_platform_driver(mtk_spi_driver);
-- 
2.39.2


