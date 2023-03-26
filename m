Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB6EC77B6C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F897TpqDCI8vVompBw8yS63wDkisJX88UMDU+YNMwwA=; b=xIzKt6Kdsyo4UlqX+38eZJGtJS
	gcvJnwC/NGlBDv1TzhhFzzEDaTCcYAMFxC9vKtJft6U01AyZmLKJV04cdZovslqk+UnEEITvEFVyS
	3JaifYjSklrHbeW+PN3kA4Vzve5ecYgJmYXZQigpW/petGdcoV6UItVZhWsKGtj0iXFgP3LrLhS1v
	J0UTAJxsrBU70TPNDS+jJ1BgeLFen21hZqh86lPomxKrNInUYONf7RZjJ/BGynd4UXJHwS5zWOtmt
	kHM9mVBVmvwxiub4E75DardowYR41zy+M1zuaZpCIQ/4kY5g1lPDJX+hcymXJ2MFutVJkGyLaLVoq
	+8u7MdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRRA-008ZMk-2z;
	Sun, 26 Mar 2023 14:33:36 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQb-008Yp8-2d
	for linux-mediatek@bombadil.infradead.org;
	Sun, 26 Mar 2023 14:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=F897TpqDCI8vVompBw8yS63wDkisJX88UMDU+YNMwwA=; b=KZ0b8YiwnyVWsx/A5UQ2CrJCiH
	2DC212TG6jxKoDGmMrXi3WJaXRqaYeBsSA7jAKEpszd9h2dQS9aurd8EE+3ANW7cixPDZjm9Ohi85
	g1z+wcGw70nBBaCKBxU/Es5TqFYBJjvInj63raPQrqVJQHrAuthczyjNNX6uiWlFhdY1dIX9dYyeX
	me9K+l4qf1VDZ82k/cq8fItUqAMtEPvO6lLwujtrQlWk0lBNpikeWUwh5JOu5qDAdmuvyZjk4ATMe
	2hBzAERuEe8FX9FAdbSM5k2zWkDxCNDcMwlGQRVS2Wlfc8N9xPTng1dJkRk4yU9Rdrpr61XQq/TJq
	GDb2eBcg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pgRQS-006aRH-Af
	for linux-mediatek@lists.infradead.org; Sun, 26 Mar 2023 14:33:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ9-0007uX-SM; Sun, 26 Mar 2023 16:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ8-006rax-CH; Sun, 26 Mar 2023 16:32:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ7-0088Vb-J9; Sun, 26 Mar 2023 16:32:31 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Qiheng Lin <linqiheng@huawei.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 028/117] media: mtk-mdp3-core: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:55 +0200
Message-Id: <20230326143224.572654-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jkf5L5dQSyQohhm9KTe95OwaXqfBXlh7AMsHg9iF88o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaoSBDTbn24ir03DGKWIxpj0tpH/SFo14z6b AA5Yd1GPEmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWqAAKCRCPgPtYfRL+ ToTHB/93xJPhkrxuOzwhK6gL5NavTvpgyizxFjQDjhtkK56Kh81623SABfB5cicKJBZkmBD/Eks h7t7fWz2Nq9y+3TAfkeb6D7mfu7euvZCNFM57LMPX2fKRAIORfa4WwtcMCnQaVITlrQCL2gLOvO 4S1GPprLyao83yeakOKSYE4EtFxsma8tmSCtjgCmkOpq7N1E4ZT6nT02OYAh2akkpKLioXVf6Ad aT2DgQVfO8oFJnVMUgPH1F/bCjDXNHvRaxNrWG98hpsAQyGO96M92JYFJuhcaK4J1P8YRNYeDBY bdBT5X+A3LMyFYlcECHJVpCdNaJJuu8/o0B3KvfR/Ibl5VVF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_153252_422956_A2840580 
X-CRM114-Status: GOOD (  13.51  )
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
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 97edcd9d1c81..041bcad675da 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -298,14 +298,13 @@ static int mdp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mdp_remove(struct platform_device *pdev)
+static void mdp_remove(struct platform_device *pdev)
 {
 	struct mdp_dev *mdp = platform_get_drvdata(pdev);
 
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
-	return 0;
 }
 
 static int __maybe_unused mdp_suspend(struct device *dev)
@@ -345,7 +344,7 @@ static const struct dev_pm_ops mdp_pm_ops = {
 
 static struct platform_driver mdp_driver = {
 	.probe		= mdp_probe,
-	.remove		= mdp_remove,
+	.remove_new	= mdp_remove,
 	.driver = {
 		.name	= MDP_MODULE_NAME,
 		.pm	= &mdp_pm_ops,
-- 
2.39.2


