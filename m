Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DADC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSWEOpI+xmK8q4GX/GNPWdiX1mu0g49qxP6ayY5UfUs=; b=HSCdkbTxNEK8wffIHdhfTiwefK
	ItZiqqS0j/h1KR3X0r+oYU+aiKvioTXLRdBqiZoqDv3fxdgZCaWDVKxri7tD27W8nRdUFwdQZUwaP
	c3jl2OXbcx6XwkNyACtTbL6t6tcrVGbfB79bobdyA87qwrlwpbGTfnvePl+/TujKtOx3D2bFWJSxZ
	uLlN5RgXlAKnSLmBhEQgGkEpQLlEQ0fYvmP69/EKKGQ81sKasm+cBIsvHZjM8VjQlO515VQddjyAI
	cId1AWWnFJnad4seaeikwp7aXJ5IIX35QBBv9yxWUKiKH+4h0J6En3Hp9SB5wauJo+fJ74lULgLH+
	Q21n9Iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY99d-006vLT-9G; Fri, 03 Mar 2023 17:25:13 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95n-006t8j-6S
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 17:21:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95e-00072T-PP; Fri, 03 Mar 2023 18:21:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95d-001bnz-N2; Fri, 03 Mar 2023 18:21:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95c-001tmD-Q0; Fri, 03 Mar 2023 18:21:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 68/87] spi: slave-mt27xx: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:20:22 +0100
Message-Id: <20230303172041.2103336-69-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Ab4V5NZ+okWKX88AVYBLab3mtSDdyIcxQSnuSDgLtMc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiwT3SuZ+Wa6QRrFub8PA8YPepqvMK8nLySg/ F6MJWnuZ1eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIsEwAKCRDB/BR4rcrs CWxhB/0QoEU2fib10Z3O5+cd2d4MMANVQKhB9U1xAcy0sCH2otwxcRCmtJfY3bICNK79r2QvLKM UPwWjN81Pgc/bvman9ENlcKIEDhXAxAnkdWU2xKyk+Gw0KBrOanaPxHQ/ORa1XuD1gvaSxcdtUN RGcpnEk9T70XagXceIfBK2W63eFeDRNANA/lNODnhuOXNqbkknB/k6oTKnoqGcXbqr5XBBsDNUu Q6eFp4vL1frpNANodvE6LiRQYfQVhmvaSadM83mFqfFiRhHZG2DxFit4dSIeCAPMqDj1+d5FJMA vYXHVo5UPbkRVQB4cTTnsEQkRimpfPFdCXgUegD6fKZyedAo
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092115_266196_EFB34F79 
X-CRM114-Status: GOOD (  14.75  )
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
 drivers/spi/spi-slave-mt27xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-slave-mt27xx.c b/drivers/spi/spi-slave-mt27xx.c
index f199a6c4738a..4e4d426bfb43 100644
--- a/drivers/spi/spi-slave-mt27xx.c
+++ b/drivers/spi/spi-slave-mt27xx.c
@@ -474,11 +474,9 @@ static int mtk_spi_slave_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_spi_slave_remove(struct platform_device *pdev)
+static void mtk_spi_slave_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -560,7 +558,7 @@ static struct platform_driver mtk_spi_slave_driver = {
 		.of_match_table = mtk_spi_slave_of_match,
 	},
 	.probe = mtk_spi_slave_probe,
-	.remove = mtk_spi_slave_remove,
+	.remove_new = mtk_spi_slave_remove,
 };
 
 module_platform_driver(mtk_spi_slave_driver);
-- 
2.39.1


