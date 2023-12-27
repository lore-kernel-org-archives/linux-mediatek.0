Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048CC46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 21:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1RYVPQ+cqXrvts9368eCgn6SwF8b/8GqQCx7e5T4sY=; b=kAAaVjJCQ73S0fuNrBopArT0uV
	mdO10QuoUN57FrCGkTfCt2S6vGl3Q6u0q967wiXN2859KvhQjsKfJY8+qi6NbbbESCrQXNCbciLup
	/yAvG/Rpvffv+mx3XjjP+CVD3EwKQw6G5HTUVOWYNvfPkQ7d9H99i0nNnXORS82GBZeRkXOzLxHB7
	M2sCRnuf5RjM4sMBC6fk+MUjhV/E3UFiM73d5PF/75LAT6WQbU0m8Z8KL5qXCkBOuWjgOgYXJmCen
	ioFHQE9mfctL2wLYsPQuIGtr/nQRe7xUCc1OTPIY6F4Fvw5htK6B7OY1PteB51LWrbU/fKyS3GSHP
	4Dlyw45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIb3c-00FV3L-22;
	Wed, 27 Dec 2023 21:03:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIb3P-00FUx4-2J
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Dec 2023 21:03:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIb3K-0000pG-42; Wed, 27 Dec 2023 22:02:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIb3I-001wF0-KN; Wed, 27 Dec 2023 22:02:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIb3J-001ZVY-24;
	Wed, 27 Dec 2023 22:02:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 05/12] mailbox: mtk-cmdq: Convert to platform remove callback returning void
Date: Wed, 27 Dec 2023 22:02:33 +0100
Message-ID: <f09086fb0576e17c5b06ea5a75e1098fb24030ec.1703710628.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703710628.git.u.kleine-koenig@pengutronix.de>
References: <cover.1703710628.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=gNPFN0uAuZF4HtjtcHLTvZm1u6vrMLv8Z7jJatbefZk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBljJDr7aKKKkVi7JPQZLLyFYy5nVbjgdGseMIZH +nO7DQaZKSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZYyQ6wAKCRCPgPtYfRL+ TirnCACWp3emXtbPKi6jzWJqse5aOSB0rU4Fj6ztni02KHtV0f8QZ8mlamimBQs1wwAFg3JamtL vtLD4W2EKwQr/k7CfonS4FAniuFJo5arz0+UqychTpBJ9ZY1vjHltDudQ6NyiqSbuNfEQ9znAID QYQCNrizRfXOn+Da8HpY0QMUoj3HEsb3SyzjnE8dDrM0aZcGGcUlKbKUq5ZzPKBEbYgKxVB7VCi ZkKEV1DeW1j9lqvyr6x6b9w95nbTQiClhVqqDKA0jEgJkeZDfpnRVaMXM9cz6uVPhREyAUtTDQ5 6JE6oYD9RAd4NQ3d/t5saKBBj1HXwkt1vcbwzKv24K8YHXqc
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_130303_783554_AD2B6A6F 
X-CRM114-Status: GOOD (  16.03  )
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
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index de862e9137d5..c9009b729ab2 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -367,7 +367,7 @@ static int cmdq_resume(struct device *dev)
 	return 0;
 }
 
-static int cmdq_remove(struct platform_device *pdev)
+static void cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
@@ -378,7 +378,6 @@ static int cmdq_remove(struct platform_device *pdev)
 		cmdq_runtime_suspend(&pdev->dev);
 
 	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
-	return 0;
 }
 
 static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -761,7 +760,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 
 static struct platform_driver cmdq_drv = {
 	.probe = cmdq_probe,
-	.remove = cmdq_remove,
+	.remove_new = cmdq_remove,
 	.driver = {
 		.name = "mtk_cmdq",
 		.pm = &cmdq_pm_ops,
-- 
2.43.0


