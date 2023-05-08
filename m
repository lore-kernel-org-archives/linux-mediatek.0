Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B92C77B7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 20:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R13vk2sBvsBQm9zTp6Wy5zEiVHqWofzKrD3eBzUhU1s=; b=Y8r9WhFYdcof5HGu1ZqFL+pM5s
	ar25piIBPWWZ+JI5JVixUviGA1SzKv9872q5C/+4HoamcXqBEJWYqHZUMja23Cc9lyZAgWgPWHA6q
	zk8lkN1csezn2jjT6k2z5lbY2v/UhLTyTs0kvlAxAtt1IxMeyiyYRjhi5YbwA/QzPznxSBEAoz547
	xKlI7auPWm6e+Sdy0uujS8s3JhX6XoQyTKZmNcqOmIT875lmRzmIYkSWtLWEUsk3iLmL8RnGgwj2F
	G/2rniG6IPkNFc+N2+PfMbsBAfcWvVpp3WEvfVMgWG5dz84yMIT2JI87lqwuI354KRO7dXDA0PRDu
	uX4xmiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7s1-001OVH-0Y;
	Mon, 08 May 2023 20:54:09 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7rS-001Nwc-2H
	for linux-mediatek@lists.infradead.org;
	Mon, 08 May 2023 20:53:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rI-0003Zc-7f; Mon, 08 May 2023 22:53:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rG-0024sB-41; Mon, 08 May 2023 22:53:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rF-002YXP-Fv; Mon, 08 May 2023 22:53:21 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 41/89] i2c: mt65xx: Convert to platform remove callback returning void
Date: Mon,  8 May 2023 22:52:18 +0200
Message-Id: <20230508205306.1474415-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wkD7FV+Lc0PR+5JXG1wfd8VmQts6ZfJJuaBPyMPzPYA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDeBC4HpemREPR9a1s67CjmmZ7e0hviqcKAD lGsSGq0oVSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg3gAKCRCPgPtYfRL+ ThR+CACI5NEFVwT0ZnZ5THDS3dGudi6hVURZOFjsRZHDssj6x/BDB0VAG4BkomUnsmKFFsZe8a/ dIUQDAEzHnyEgxKckwryL4jraKwVl8SklB998yVTzJ3rWT3VjLBcrJq8YWxKfI73jTNaISpTA0m q748dmYmgLppat+YGTEvuHMhZAFM2Y9IyOrhvTBjC30u996gUFPdarO6KZXDwZ8AC4K2ks55mir KD37LbAKX2LozaP+YaGrh/5qnJ/QkP9X8IYKlnrmsnv0ylMcNgJBwxaaCIGSjd65yauuyj0y4DV MlpcSvIQUfCzlRQQzej8+/bus+j8SIe8sRsQyDhRcp+a4Loc
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_135334_746952_727FCB60 
X-CRM114-Status: GOOD (  16.46  )
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
 drivers/i2c/busses/i2c-mt65xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a43c4d77739a..7ca3f2221ba6 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1505,15 +1505,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_i2c_remove(struct platform_device *pdev)
+static void mtk_i2c_remove(struct platform_device *pdev)
 {
 	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c->adap);
 
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1555,7 +1553,7 @@ static const struct dev_pm_ops mtk_i2c_pm = {
 
 static struct platform_driver mtk_i2c_driver = {
 	.probe = mtk_i2c_probe,
-	.remove = mtk_i2c_remove,
+	.remove_new = mtk_i2c_remove,
 	.driver = {
 		.name = I2C_DRV_NAME,
 		.pm = &mtk_i2c_pm,
-- 
2.39.2


